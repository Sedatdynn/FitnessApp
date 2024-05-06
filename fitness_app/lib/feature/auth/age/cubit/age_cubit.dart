import 'package:fistness_app_firebase/feature/auth/age/cubit/age_state.dart';
import 'package:fistness_app_firebase/feature/auth/age/cubit/i_age_cubit.dart';

class AgeCubit extends IAgeCubit {
  AgeCubit() : super(AgeState.initial()) {
    init();
  }

  /// init func to call when the [AgeCubit] is initialized
  @override
  void init() => calculateMaxValue();

  @override
  int get birthYear => state.birthYear!;
  @override
  int get maxValue => state.maxValue!;

  /// setting initial number picker's values to the state to show it in view
  @override
  void calculateMaxValue() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int maxValue = currentYear - 18;
    int minValue = currentYear - 60;
    emit(state.copyWith(maxValue: maxValue, birthYear: maxValue, minValue: minValue));
  }

  /// Set func to setting the birthYear into the state
  @override
  void setBirthYear(int value) => emit(state.copyWith(birthYear: value));
}
