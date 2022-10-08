import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fistness_app_firebase/views/home/model/foods_model.dart';

abstract class IFoodService {
  IFoodService(this.dio);
  final Dio dio;

  Future<FoodsModel?> fetchFoodsItem();
}

class FoodService extends IFoodService {
  FoodService(super.dio);

  @override
  Future<FoodsModel?> fetchFoodsItem() async {
    final response = await dio.get("/foods");

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return FoodsModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
