import 'package:dio/dio.dart';

abstract class BaseService {
  BaseService(this.dio, this.item);
  final Dio dio;
  final String item;
}
