import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  @override
  void init() {}

  void changeVisible() => emit(state.copyWith(isVisible: !state.isVisible));
  void setUsername(String username) => emit(state.copyWith(username: username));
  void setNameSurname(String nameSurname) => emit(state.copyWith(nameSurname: nameSurname));
  void setEmail(String email) => emit(state.copyWith(email: email));
  void setPassword(String password) => emit(state.copyWith(password: password));

  void registerUser() {
    RouteManager.instance.push(GenderRoute(
      username: state.username,
      mail: state.email,
      password: state.password,
      name: state.nameSurname,
    ));
  }
}
