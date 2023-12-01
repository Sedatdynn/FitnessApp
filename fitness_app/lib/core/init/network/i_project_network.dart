abstract class IProjectNetwork {
  Future dioGet({
    required String path,
    required dynamic model,
  });

  Future dioPost({
    required String path,
    required dynamic model,
    required dynamic responseModel,
  });
}
