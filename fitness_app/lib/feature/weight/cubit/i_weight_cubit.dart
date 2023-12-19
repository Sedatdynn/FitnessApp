import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/feature/weight/params/calculate_func_params.dart';

abstract class IWeightCubit extends BaseCubit<WeightState> {
  IWeightCubit(super.initialState);
  int get selectedValue;
  void setSelectedValue(int value);
  void setTotalPoint(int value);
  Future<void> calculateTotalPoints({required CalculateParams params});
  void calculateMobility(String mobility);
  void calculateAge(int age);
  void calculateWeight(int weight);
}
