import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';

abstract class IExerciseService {
  BaseResponseData<ExercisesModel> fetchExercises();
}
