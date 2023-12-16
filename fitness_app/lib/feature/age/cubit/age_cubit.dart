import 'package:fistness_app_firebase/feature/age/cubit/age_state.dart';
import 'package:fistness_app_firebase/feature/age/cubit/i_age_cubit.dart';

class AgeCubit extends IAgeCubit {
  AgeCubit() : super(AgeState.initial()) {
    init();
  }

  @override
  void init() => calculateMaxValue();

  @override
  int get birthYear => state.birthYear!;
  @override
  int get maxValue => state.maxValue!;

  @override
  void calculateMaxValue() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int maxValue = currentYear - 18;
    int minValue = currentYear - 60;
    emit(state.copyWith(maxValue: maxValue, birthYear: maxValue, minValue: minValue));
  }

  @override
  setBirthYear(int value) {
    emit(state.copyWith(birthYear: value));
  }
}
