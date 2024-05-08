import 'package:fistness_app_firebase/core/base/model/base_model.dart';
import 'package:fistness_app_firebase/core/base/model/base_response_model.dart';

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
