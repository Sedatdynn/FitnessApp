import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_state.dart';

abstract class IRegisterCubit extends BaseCubit<RegisterState> {
  IRegisterCubit(super.initialState);
  void changeVisible();
  void setUsername(String username);
  void setNameSurname(String nameSurname);
  void setEmail(String email);
  void setPassword(String password);
  void registerUser();
}
