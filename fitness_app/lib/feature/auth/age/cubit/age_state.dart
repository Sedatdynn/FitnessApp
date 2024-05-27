import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/age/enum/age_states.dart';

class AgeState extends BaseState {
  const AgeState({
    required this.states,
    required this.birthYear,
    required this.maxValue,
    required this.minValue,
  });

  //initial state
  factory AgeState.initial() {
    return const AgeState(
      states: AgeStates.initial,
      birthYear: null,
      maxValue: null,
      minValue: null,
    );
  }
  final AgeStates states;
  final int? birthYear;
  final int? maxValue;
  final int? minValue;

  @override
  List<Object?> get props => [states, birthYear, maxValue, minValue];

  AgeState copyWith({
    AgeStates? states,
    int? birthYear,
    int? maxValue,
    int? minValue,
  }) {
    return AgeState(
      states: states ?? this.states,
      birthYear: birthYear ?? this.birthYear,
      maxValue: maxValue ?? this.maxValue,
      minValue: minValue ?? this.minValue,
    );
  }
}
