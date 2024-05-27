import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';

class DietState extends BaseState {
  const DietState({
    required this.states,
    required this.lastSavedPoint,
    required this.currentTotalPoint,
    required this.foods,
  });

  factory DietState.initial() {
    return const DietState(
      states: DietStates.initial,
      lastSavedPoint: 0,
      currentTotalPoint: 0,
      foods: [],
    );
  }
  final DietStates states;
  final double? lastSavedPoint;
  final double? currentTotalPoint;
  final List<Category> foods;

  @override
  List<Object?> get props => [states, lastSavedPoint, currentTotalPoint, foods];

  DietState copyWith({
    DietStates? states,
    double? lastSavedPoint,
    double? currentTotalPoint,
    List<Category>? foods,
  }) {
    return DietState(
      states: states ?? this.states,
      lastSavedPoint: lastSavedPoint ?? this.lastSavedPoint,
      currentTotalPoint: currentTotalPoint ?? this.currentTotalPoint,
      foods: foods ?? this.foods,
    );
  }
}

enum DietStates { initial, loading, completed, error }
