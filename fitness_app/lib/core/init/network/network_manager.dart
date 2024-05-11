import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fistness_app_firebase/core/base/exception/exception.dart';
import 'package:fistness_app_firebase/core/base/model/base_model.dart';
import 'package:fistness_app_firebase/core/base/model/base_response_model.dart';
import 'package:fistness_app_firebase/core/init/network/i_network_manager.dart';

class NetworkManager extends INetworkManager {
  NetworkManager._init();
  late final Dio _dio;
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    return _instance ??= NetworkManager._init();
  }

  @override
  Future<void> init({
    /// base url
    required String baseUrl,

    /// send timeout seconds
    required int sendTimeOut,

    /// connect timeOut seconds
    required int connectTimeOut,

    /// receive time out seconds
    required int receiveTimeOut,
  }) async {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: Duration(seconds: sendTimeOut),
      connectTimeout: Duration(seconds: connectTimeOut),
      receiveTimeout: Duration(seconds: receiveTimeOut),
      validateStatus: (status) {
        return status! < 401;
      },
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );
    _dio = Dio(baseOptions);
  }

  @override
  Future<BaseResponseModel<T>> dioGet<T extends BaseModel<T>>({
    required String path,
    required T model,
  }) async {
    try {
      final response = await _dio.get<dynamic>(path);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return BaseResponseModel(data: model.fromJson(jsonBody));
        }
      }
    } on DioException catch (e) {
      return BaseResponseModel(
        serverException: ServerException(
          message: e.message.toString(),
          statusCode: e.response?.statusCode.toString() ?? '505',
        ),
      );
    } catch (e) {
      return BaseResponseModel(
        serverException: ServerException(message: e.toString(), statusCode: '505'),
      );
    }
    return BaseResponseModel(
      serverException: const ServerException(message: 'Unknown Error', statusCode: '505'),
    );
  }
}
