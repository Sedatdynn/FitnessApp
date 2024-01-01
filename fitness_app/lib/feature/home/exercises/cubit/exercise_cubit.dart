import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_state.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/i_exercise_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/service/exercise_service.dart';
import 'package:fistness_app_firebase/feature/home/exercises/service/i_exercise_service.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class ExerciseCubit extends IExerciseCubit {
  late IExerciseService _exerciseService;
  String item = "exercises";

  ExerciseCubit() : super(ExerciseState.initial()) {
    init();
  }

  @override
  Future<void> init() async {
    _exerciseService = ExerciseService();
    await fetchExercises();
  }

  @override
  Future<void> fetchExercises() async {
    final response = await _exerciseService.fetchExercises();
    response.fold((l) => warningToast(l.message), (r) {
      emit(state.copyWith(exercises: r.exercise));
      print(state.exercises!.length);
    });
  }
}
