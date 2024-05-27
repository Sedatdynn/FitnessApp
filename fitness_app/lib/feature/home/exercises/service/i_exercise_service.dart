import 'package:core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';

abstract class IExerciseService {
  BaseResponseData<ExercisesModel> fetchExercises();
}
