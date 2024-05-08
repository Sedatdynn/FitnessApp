import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

abstract class IWeightCubit extends BaseCubit<WeightState> {
  IWeightCubit(super.initialState);
  int get selectedValue;
  void setSelectedValue(int value);
  void setTotalPoint(int value);
  Future<void> calculateTotalPoints({required UserModel params});
  void clearErrorMessage();
}
