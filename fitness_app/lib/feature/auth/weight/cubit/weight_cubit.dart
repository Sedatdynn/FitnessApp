import '../../../../core/navigator/app_router.dart';
import '../../../../core/navigator/manager/auto_route_manager.dart';
import '../../../../core/service/auth_service.dart';
import '../../../../product/global/service/global_service.dart';
import '../../../../product/models/user_model.dart';
import '../params/weight_params.dart';
import 'i_weight_cubit.dart';
import 'weight_state.dart';

class WeightCubit extends IWeightCubit {
  WeightCubit() : super(WeightState.initial()) {
    init();
  }

  @override
  void init() => emit(state.copyWith(selectedValue: 65));

  @override
  setSelectedValue(int value) {
    emit(state.copyWith(selectedValue: value));
  }

  @override
  setTotalPoint(int value) {
    emit(state.copyWith(totalPoint: value));
  }

  @override
  int get selectedValue => state.selectedValue!;

  @override
  Future<void> calculateTotalPoints({required UserModel params}) async {
    int lastPoint = await GlobalService().calculateTotalPoints(user: params);

    setTotalPoint(lastPoint);
  }

  Future<void> createPerson(
      {required WeightParams params, required Future<void> Function() function}) async {
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
            weight: state.selectedValue!,
            userRightPoint: state.totalPoint));

    result.fold((failure) async {
      emit(state.copyWith(errorMessage: failure.message));
    }, (r) async {
      await function();
      RouteManager.instance.pushAndPopUntil(LoginRoute(canPop: false));
    });
  }
}
