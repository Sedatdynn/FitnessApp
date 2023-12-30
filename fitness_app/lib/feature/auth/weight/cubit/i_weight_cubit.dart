import '../../../../core/base/cubit/base_cubit.dart';
import '../../../../product/models/user_model.dart';
import 'weight_state.dart';

abstract class IWeightCubit extends BaseCubit<WeightState> {
  IWeightCubit(super.initialState);
  int get selectedValue;
  void setSelectedValue(int value);
  void setTotalPoint(int value);
  Future<void> calculateTotalPoints({required UserModel params});
}
