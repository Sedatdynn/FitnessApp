import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/home/model/foods_model.dart';

abstract class IGeneralService {
  IGeneralService(
    this.dio,
    this.item,
  );
  final Dio dio;
  String item;

  Future<FoodsModel?> fetchFoodsItem();
  Future<ExercisesModel?> fetchExercisesItem();
}

class GeneralService extends IGeneralService {
  GeneralService(
    super.dio,
    super.item,
  );

  @override
  Future<FoodsModel?> fetchFoodsItem() async {
    final response = await dio.get("/$item");

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return FoodsModel.fromJson(jsonBody);
      }
    }
    return null;
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
