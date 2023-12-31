abstract class INetworkManager {
  init({
    required String baseUrl,
    required int sendTimeOut,
    required int connectTimeOut,
    required int receiveTimeOut,
  });
  Future dioGet({required String path, required model});
}
