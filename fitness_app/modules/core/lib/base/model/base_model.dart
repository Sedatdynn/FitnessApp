import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  //Creates an object from the Map data structure
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
