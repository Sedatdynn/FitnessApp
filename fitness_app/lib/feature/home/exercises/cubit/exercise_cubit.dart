import 'dart:developer';

import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_state.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/i_exercise_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/service/exercise_service.dart';
import 'package:fistness_app_firebase/feature/home/exercises/service/i_exercise_service.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class ExerciseCubit extends IExerciseCubit {
  ExerciseCubit() : super(ExerciseState.initial()) {
    init();
  }
  late IExerciseService _exerciseService;
  String item = 'exercises';

  /// initialize func
  @override
  Future<void> init() async {
    _exerciseService = ExerciseService();
    await fetchExercises();
  }

  /// fetching exercise from the service
  @override
  Future<void> fetchExercises() async {
    final response = await _exerciseService.fetchExercises();
    await response.fold((l) => warningToast(l.message), (r) {
      emit(state.copyWith(exercises: r.exercise));
      log(state.exercises!.length.toString());
    });
  }
}
