import 'package:core/core.dart';

abstract class INetworkManager {
  Future<void> init({
    required String baseUrl,
    required int sendTimeOut,
    required int connectTimeOut,
    required int receiveTimeOut,
  });
  Future<BaseResponseModel<T>> dioGet<T extends BaseModel<T>>({
    required String path,
    required T model,
  });
}
