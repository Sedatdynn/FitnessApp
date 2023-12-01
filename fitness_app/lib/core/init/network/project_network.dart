import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fistness_app_firebase/core/init/network/i_project_network.dart';

class ProjectNetworkManager extends IProjectNetwork {
  ProjectNetworkManager._() {
    print('INNIT -');
    _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000"));
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  @override
  Future dioGet({required String path, required model}) async {
    final response = await _dio.get("/$path");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return model.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future dioPost({required String path, required model, required responseModel}) async {
    var json = model.toJson();
    final response = await _dio.post(path, data: json);
    throw UnimplementedError();
  }
}
