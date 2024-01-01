import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_state.dart';

abstract class IExerciseCubit extends BaseCubit<ExerciseState> {
  IExerciseCubit(super.initialState);
  Future<void> fetchExercises();
}
