import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/age/cubit/age_state.dart';

abstract class IAgeCubit extends BaseCubit<AgeState> {
  IAgeCubit(super.initialState);
  int get birthYear;
  int get maxValue;
  void calculateMaxValue();
  void setBirthYear(int value);
}
