// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel extends Equatable {
  final String? username;
  final String? email;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String? mobility;
  final String? height;
  final String? weight;
  final String? userRightPoint;
  const UserModel(
      {required this.username,
      required this.email,
      required this.name,
      required this.password,
      required this.gender,
      required this.age,
      required this.mobility,
      required this.height,
      required this.weight,
      required this.userRightPoint});
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  Map<String, dynamic> toJsonWithoutPassword() {
    final json = _$UserModelToJson(this);
    json.remove('password');
    return json;
  }

  @override
  List<Object?> get props =>
      [username, email, name, password, gender, age, mobility, height, weight, userRightPoint];

  UserModel copyWith({
    String? username,
    String? email,
    String? name,
    String? password,
    String? gender,
    String? age,
    String? mobility,
    String? height,
    String? weight,
    String? userRightPoint,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      mobility: mobility ?? this.mobility,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      userRightPoint: userRightPoint ?? this.userRightPoint,
    );
  }
}
