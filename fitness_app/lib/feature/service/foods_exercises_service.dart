// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../exercises/model/exercises_model.dart';
import '../home/model/foods_model.dart';
import '../login/token_model.dart';

abstract class IGeneralService {
  IGeneralService(
    this.dio,
    this.item,
  );
  final Dio dio;
  String item;

  Future<FoodsModel?> fetchFoodsItem();
  Future<ExercisesModel?> fetchExercisesItem();
  Future registerUser(Map<String, dynamic> registerData);
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
  Future<bool?> resetPasswordLink(String email) async {
    try {
      final response =
          await dio.post("/reset-password", data: {"email": email});

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
        final jsonBody = response.data;
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
        SharedPreferences prefs = await SharedPreferences.getInstance();

        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final tok = TokenModel.fromJson(jsonBody);
          prefs.setString("token", tok.token!);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> checkToken(String? token) async {
    try {
      final response = await dio.post("/token", data: {
        "token": token,
      });
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
