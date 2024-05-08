// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? username;
  final String? email;
  final String? password;
  final String? name;
  final String? gender;
  final int? age;
  final String? mobility;
  final int? height;
  final int? weight;
  final int? userRightPoint;
  const UserModel({
    this.username,
    this.email,
    this.name,
    this.password,
    this.gender,
    this.age,
    this.mobility,
    this.height,
    this.weight,
    this.userRightPoint,
  });
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  Map<String, dynamic> toJsonWithoutPassword() {
    final json = _$UserModelToJson(this);
    final updatedJson = json.remove('password');
    return updatedJson as Map<String, dynamic>;
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
    int? age,
    String? mobility,
    int? height,
    int? weight,
    int? userRightPoint,
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
