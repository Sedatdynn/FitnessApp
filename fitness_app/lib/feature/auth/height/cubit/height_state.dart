import 'package:core/base/cubit/base_cubit.dart';

class HeightState extends BaseState {
  const HeightState({
    required this.states,
    required this.selectedValue,
  });

  factory HeightState.initial() {
    return const HeightState(
      states: HeightStates.initial,
      selectedValue: null,
    );
  }
  final HeightStates states;
  final int? selectedValue;

  @override
  List<Object?> get props => [states, selectedValue];

  HeightState copyWith({
    HeightStates? states,
    int? selectedValue,
    int? maxValue,
    int? minValue,
  }) {
    return HeightState(
      states: states ?? this.states,
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}

enum HeightStates { initial, loading, error, completed }
