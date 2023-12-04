// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  const LoginModel({required this.email, required this.password});
  final String? email;
  final String? password;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [email, password];

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
