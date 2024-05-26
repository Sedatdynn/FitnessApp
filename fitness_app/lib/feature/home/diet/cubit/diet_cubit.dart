import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/i_diet_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';
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

  /// initial func calling when diet cubit detected for first time
  @override
  Future<void> init() async {
    _dietService = DietService();
    emit(
      state.copyWith(
        lastSavedPoint: getCachedPoint,
      ),
    );
    await fetch();
  }

  /// fetch diet items from the server
  @override
  Future<void> fetch() async {
    final response = await _dietService.fetchDiets();
    await response.fold((l) => warningToast(l.message), (r) {
      emit(state.copyWith(foods: r.category ?? []));
    });
  }

  /// save the current point over cached point
  @override
  Future<void> savePoint() async {
    final currentTotalPoint = state.currentTotalPoint ?? 0.0;
    final newTotalPoint = getCachedPoint + currentTotalPoint;
    await CacheManager.instance.setDoubleValue(CacheKeys.point, newTotalPoint);

    emit(state.copyWith(lastSavedPoint: getCachedPoint));
    await clearList();
  }

  /// get cached point
  @override
  double get getCachedPoint => CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;

  /// reset saved score from the cache
  @override
  Future<void> resetPoint() async {
    await CacheManager.instance.removeValue(CacheKeys.point);
    emit(state.copyWith(lastSavedPoint: 0));
    await clearList();
  }

  @override
  Future<void> checkBoxActivity(int index1, int index2, {required bool value}) async {
    // check if content is exist
    final content = state.foods[index1].content;
    if (content == null || content.length <= index2) return;

    final item = content[index2];
    final updatedItem = item.copyWith(control: value);

    // update score
    final scoreChange =
        (updatedItem.control ?? false) ? updatedItem.score ?? 0 : -(item.score ?? 0);

    // update total score and updated content
    final updatedContent = List<Content>.from(content);
    updatedContent[index2] = updatedItem;
    state.foods[index1] = state.foods[index1].copyWith(content: updatedContent);

    // update total score
    totalPoint += scoreChange;

    emit(state.copyWith(currentTotalPoint: totalPoint));
  }

  /// clear the current point
  @override
  Future<void> clearList() async {
    await fetch().then((_) {
      emit(state.copyWith(currentTotalPoint: 0));
      totalPoint = 0;
    });
  }
}
