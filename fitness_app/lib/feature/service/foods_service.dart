import 'dart:io';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';

import 'i_foods_service.dart';

class FoodsService extends IFoodsService {
  FoodsService(super.dio, super.item);

  @override
  Future<FoodsModel?> fetchFoodsItem() async {
    final response = await dio.get("/$item");
    print('****************************************************************');
    print(item);
    print('****************************************************************');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return const FoodsModel().fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<bool?> resetPasswordLink(String email) async {
    try {
      final response = await dio.post("/reset-password", data: {"email": email});

      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ExercisesModel?> fetchExercisesItem() async {
    final response = await dio.get("/$item");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ExercisesModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
