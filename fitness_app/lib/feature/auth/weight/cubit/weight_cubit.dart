import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/i_weight_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/product/global/service/global_service.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

class WeightCubit extends IWeightCubit {
  WeightCubit() : super(WeightState.initial()) {
    init();
  }

  @override
  void init() => emit(state.copyWith(selectedValue: 65));

  @override
  void setSelectedValue(int value) => emit(state.copyWith(selectedValue: value));

  @override
  void setTotalPoint(int value) => emit(state.copyWith(totalPoint: value));

  @override
  void clearErrorMessage() => emit(state.copyWith(errorMessage: ''));

  @override
  int get selectedValue => state.selectedValue!;

  @override
  Future<void> calculateTotalPoints({required UserModel params}) async {
    final lastPoint = await GlobalService().calculateTotalPoints(user: params);
    setTotalPoint(lastPoint);
  }

  // create person with firebase and save it to firestore db
  Future<void> createPerson({
    required WeightParams params,
    required Future<void> Function() function,
  }) async {
    final result = await AuthService.instance.createPerson(
      model: UserModel(
        username: params.username,
        email: params.mail,
        name: params.name,
        password: params.password,
        gender: params.gender,
        age: params.birthYear,
        mobility: params.mobility,
        height: params.height,
        weight: state.selectedValue,
        userRightPoint: state.totalPoint,
      ),
    );

    await result.fold((failure) async {
      emit(state.copyWith(errorMessage: failure.message));
    }, (r) async {
      await function();
      RouteManager.instance.pushAndPopUntil(LoginRoute(canPop: false));
    });
  }
}
