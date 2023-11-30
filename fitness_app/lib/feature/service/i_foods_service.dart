import '../../core/base/service/base_service.dart';
import '../exercises/model/exercises_model.dart';
import '../home/model/foods_model.dart';

abstract class IFoodsService extends BaseService {
  IFoodsService(super.dio, super.item);
  Future<bool?> resetPasswordLink(String email);
  Future<FoodsModel?> fetchFoodsItem();
  Future<ExercisesModel?> fetchExercisesItem();
  Future<bool?> registerUser(Map<String, dynamic> registerData);
}
