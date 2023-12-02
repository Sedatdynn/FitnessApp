import 'dart:io';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import '../exercises/model/exercises_model.dart';
import '../home/model/foods_model.dart';
import '../login/token_model.dart';
import 'i_foods_service.dart';

class FoodsService extends IFoodsService {
  FoodsService(super.dio, super.item);

  @override
  Future<FoodsModel?> fetchFoodsItem() async {
    final response = await dio.get("/$item");

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return FoodsModel().fromJson(jsonBody);
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
  Future<bool?> registerUser(Map<String, dynamic> registerData) async {
    try {
      final response = await dio.post("/register", data: {
        "email": registerData["email"],
        "username": registerData["username"],
        "password": registerData["password"],
        "sex": registerData["sex"],
        "age": registerData["age"],
        "weight": registerData["weight"],
        "height": registerData["height"]
      });

      if (response.statusCode == HttpStatus.created) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> loginUser(Map<String, dynamic> loginData) async {
    try {
      final response = await dio.post("/login", data: {
        "email": loginData["email"],
        "password": loginData["password"],
      });

      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final tok = TokenModel().fromJson(jsonBody);
          await CacheManager.instance.setStringValue(CacheKeys.token, tok.token!);
          return true;
        }
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
