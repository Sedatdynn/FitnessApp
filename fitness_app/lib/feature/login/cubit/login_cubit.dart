import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/login/cubit/i_login_cubit.dart';
import 'package:fistness_app_firebase/feature/login/cubit/login_state.dart';
import 'package:fistness_app_firebase/feature/login/model/login_model.dart';

class LoginCubit extends ILoginCubit {
  LoginCubit() : super(LoginState.initial()) {
    init();
  }

  @override
  void changeVisible() => emit(state.copyWith(isVisible: !state.isVisible));
  @override
  void setEmail(String email) => emit(state.copyWith(email: email));
  @override
  void setPassword(String password) => emit(state.copyWith(password: password));
  @override
  void setErrorMessage(String message) => emit(state.copyWith(errorMessage: message));

  @override
  void init() {}

  @override
  Future<void> signIn() async {
    final result = await AuthService.instance.signInWithEmailAndPassword(
      model: LoginModel(email: state.email, password: state.password),
    );

    result.fold((failure) => setErrorMessage(failure.message), (r) {
      RouteManager.instance.pushNamed(path: RouteConstants.main);
    });
  }
}
