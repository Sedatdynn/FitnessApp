import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  T fromJson(Map<String, dynamic> json);
}
