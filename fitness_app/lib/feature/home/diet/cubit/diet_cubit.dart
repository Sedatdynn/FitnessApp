import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/i_diet_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/service/diet_service.dart';
import 'package:fistness_app_firebase/feature/home/diet/service/i_diet_service.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class DietCubit extends IDietCubit {
  DietCubit() : super(DietState.initial()) {
    init();
  }
  late IDietService _dietService;
  double totalPoint = 0;

  @override
  Future<void> init() async {
    _dietService = DietService();
    emit(
      state.copyWith(
        lastSavedPoint: CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0,
      ),
    );
    await fetch();
  }

  Future<void> fetch() async {
    final response = await _dietService.fetchDiets();
    await response.fold((l) => warningToast(l.message), (r) {
      emit(state.copyWith(foods: r.kategori ?? []));
    });
  }

  Future<void> savePoint() async {
    final lastPoint = CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;
    await CacheManager.instance
        .setDoubleValue(CacheKeys.point, lastPoint + state.currentTotalPoint!);

    final savedPoint = CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;
    emit(state.copyWith(lastSavedPoint: savedPoint));
    await clearList();
  }

  Future<void> resetPoint() async {
    await CacheManager.instance.removeValue(CacheKeys.point);
    emit(state.copyWith(lastSavedPoint: 0));
    await clearList();
  }

  Future<void> checkBoxActivity(int index1, int index2, {required bool value}) async {
    state.foods[index1].icerik![index2] =
        state.foods[index1].icerik![index2].copyWith(kontrol: value);
    if (state.foods[index1].icerik![index2].kontrol!) {
      totalPoint += state.foods[index1].icerik![index2].puan!;
      emit(state.copyWith(currentTotalPoint: totalPoint));
    } else {
      totalPoint -= state.foods[index1].icerik![index2].puan!;
      emit(state.copyWith(currentTotalPoint: totalPoint));
    }
  }

  Future<void> clearList() async {
    await fetch().then((value) {
      emit(state.copyWith(currentTotalPoint: 0));
      totalPoint = 0;
    });
  }
}
