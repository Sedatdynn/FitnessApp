import 'package:core/base/exception/exception.dart';

class BaseResponseModel<T> {
  BaseResponseModel({this.data, this.serverException});
  final T? data;
  final ServerException? serverException;
}
