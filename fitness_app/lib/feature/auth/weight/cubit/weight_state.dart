import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';

class WeightState extends BaseState {
  const WeightState(
      {required this.states,
      required this.selectedValue,
      required this.totalPoint,
      required this.errorMessage});
  final WeightStates states;
  final int? selectedValue;
  final int? totalPoint;
  final String? errorMessage;

  factory WeightState.initial() {
    return const WeightState(
      states: WeightStates.initial,
      selectedValue: null,
      totalPoint: null,
      errorMessage: null,
    );
  }

  @override
  List<Object?> get props => [states, selectedValue, totalPoint, errorMessage];

  WeightState copyWith(
      {WeightStates? states, int? selectedValue, int? totalPoint, String? errorMessage}) {
    return WeightState(
      states: states ?? this.states,
      selectedValue: selectedValue ?? this.selectedValue,
      totalPoint: totalPoint ?? this.totalPoint,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum WeightStates { initial, loading, error, completed }
