import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/feature/home/exercises/service/i_exercise_service.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';

class ExerciseService extends IExerciseService {
  ExerciseService();

  @override
  BaseResponseData<ExercisesModel> fetchExercises() async {
    final response = await NetworkManager.instance!
        .dioGet<ExercisesModel>(path: '/exercises', model: ExercisesModel());
    if (response is ServerException) {
      return Left(
        ServerException(
          message: response.serverException!.message,
          statusCode: response.serverException!.statusCode,
        ),
      );
    } else {
      return Right(response.data!);
    }
  }
}
