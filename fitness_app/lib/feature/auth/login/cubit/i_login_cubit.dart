import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/login/cubit/login_state.dart';

abstract class ILoginCubit extends BaseCubit<LoginState> {
  ILoginCubit(super.initialState);
  void changeVisible();
  void setEmail(String email);
  void setPassword(String password);
  void setErrorMessage(String message);
  void clearErrorMessage();
  Future<void> signIn();
}
