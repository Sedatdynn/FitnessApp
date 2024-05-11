import 'package:fistness_app_firebase/feature/auth/age/age_shelf.dart';

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
    final now = DateTime.now();
    final currentYear = now.year;
    final maxValue = currentYear - 18;
    final minValue = currentYear - 60;
    emit(state.copyWith(maxValue: maxValue, birthYear: maxValue, minValue: minValue));
  }

  /// Set func to setting the birthYear into the state
  @override
  void setBirthYear(int value) => emit(state.copyWith(birthYear: value));
}
