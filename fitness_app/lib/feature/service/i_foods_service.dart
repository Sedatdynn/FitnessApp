import 'package:fistness_app_firebase/feature/homex/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/feature/homex/home/model/foods_model.dart';

import '../../core/base/service/base_service.dart';

abstract class IFoodsService extends BaseService {
  IFoodsService(super.dio, super.item);
  Future<bool?> resetPasswordLink(String email);
  Future<FoodsModel?> fetchFoodsItem();
  Future<ExercisesModel?> fetchExercisesItem();
}
