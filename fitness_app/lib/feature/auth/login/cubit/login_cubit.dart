import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/auth/login/cubit/i_login_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/login/cubit/login_state.dart';
import 'package:fistness_app_firebase/feature/auth/login/model/login_model.dart';

class LoginCubit extends ILoginCubit {
  LoginCubit() : super(LoginState.initial());

  @override
  void init() {}

  // for login password text field
  @override
  void changeVisible() => emit(state.copyWith(isVisible: !state.isVisible));

  // for login email text field
  @override
  void setEmail(String email) => emit(state.copyWith(email: email));

  // setting password to state
  @override
  void setPassword(String password) => emit(state.copyWith(password: password));

  // setting error message to state
  @override
  void setErrorMessage(String message) => emit(state.copyWith(errorMessage: message));

  // to clear error message in state
  @override
  void clearErrorMessage() => emit(state.copyWith(errorMessage: ''));

  // Sign in method with firebase authentication
  @override
  Future<void> signIn() async {
    final result = await AuthService.instance.signInWithEmailAndPassword(
      model: LoginModel(email: state.email, password: state.password),
    );
    result.fold(
      (failure) => setErrorMessage(failure.message),
      (success) => RouteManager.instance.pushNamed(path: RouteConstants.main),
    );
  }
}
