import 'package:dio/dio.dart';

abstract class BaseService {
  final Dio dio;
  final String item;

  BaseService(this.dio, this.item);
}
