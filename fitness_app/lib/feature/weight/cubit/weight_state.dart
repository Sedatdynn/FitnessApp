import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';

class WeightState extends BaseState {
  const WeightState({required this.states, required this.selectedValue, required this.totalPoint});
  final WeightStates states;
  final int? selectedValue;

  final int? totalPoint;

  factory WeightState.initial() {
    return const WeightState(
      states: WeightStates.initial,
      selectedValue: null,
      totalPoint: null,
    );
  }

  @override
  List<Object?> get props => [states, selectedValue, totalPoint];

  WeightState copyWith({
    WeightStates? states,
    int? selectedValue,
    int? totalPoint,
  }) {
    return WeightState(
      states: states ?? this.states,
      selectedValue: selectedValue ?? this.selectedValue,
      totalPoint: totalPoint ?? this.totalPoint,
    );
  }
}

enum WeightStates { initial, loading, error, completed }
