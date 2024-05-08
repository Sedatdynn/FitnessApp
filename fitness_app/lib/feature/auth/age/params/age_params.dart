import 'package:equatable/equatable.dart';

class AgeParams extends Equatable {
  const AgeParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
    required this.gender,
  });
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String? gender;

  @override
  List<Object?> get props => [username, mail, name, password, gender];
}
