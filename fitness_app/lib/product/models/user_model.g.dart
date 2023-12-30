// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as int?,
      mobility: json['mobility'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      userRightPoint: json['userRightPoint'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'mobility': instance.mobility,
      'height': instance.height,
      'weight': instance.weight,
      'userRightPoint': instance.userRightPoint,
    };
