import 'package:fistness_app_firebase/core/base/exception/exception.dart';
import 'package:fistness_app_firebase/core/init/network/network_manager.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';

import 'i_exercise_service.dart';

class ExerciseService extends IExerciseService {
  ExerciseService();

  @override
  BaseResponseData<ExercisesModel> fetchExercises() async {
    final response =
        await NetworkManager.instance.dioGet(path: '/exercises', model: const ExercisesModel());
    if (response is ServerException) {
      return Left(ServerException(message: response.message, statusCode: response.statusCode));
    } else {
      return Right(response);
    }
  }
}
