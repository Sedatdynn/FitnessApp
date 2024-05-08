import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';

class ExerciseState extends BaseState {
  const ExerciseState({required this.states, required this.exercises});

  factory ExerciseState.initial() {
    return const ExerciseState(
      states: ExerciseStates.initial,
      exercises: null,
    );
  }
  final ExerciseStates states;

  final List<Exercise>? exercises;

  @override
  List<Object?> get props => [states, exercises];

  ExerciseState copyWith({
    ExerciseStates? states,
    List<Exercise>? exercises,
  }) {
    return ExerciseState(
      states: states ?? this.states,
      exercises: exercises ?? this.exercises,
    );
  }
}

enum ExerciseStates { initial, loading, completed, error }
