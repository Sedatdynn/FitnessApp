import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/auth/gender/params/gender_params.dart';
import 'package:fistness_app_firebase/feature/auth/register/cubit/i_register_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/register/cubit/register_state.dart';

class RegisterCubit extends IRegisterCubit {
  RegisterCubit() : super(RegisterState.initial());

  @override
  void init() {}

  @override
  void changeVisible() => emit(state.copyWith(isVisible: !state.isVisible));
  @override
  void setUsername(String username) => emit(state.copyWith(username: username));
  @override
  void setNameSurname(String nameSurname) => emit(state.copyWith(nameSurname: nameSurname));
  @override
  void setEmail(String email) => emit(state.copyWith(email: email));
  @override
  void setPassword(String password) => emit(state.copyWith(password: password));

  @override
  void registerUser() {
    RouteManager.instance.push(
      GenderRoute(
        params: GenderParams(
          username: state.username,
          mail: state.email,
          password: state.password,
          name: state.nameSurname,
        ),
      ),
    );
  }
}
