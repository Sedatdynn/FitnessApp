import 'package:equatable/equatable.dart';

class GenderParams extends Equatable {
  const GenderParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
  });
  final String? username;
  final String? mail;
  final String? name;
  final String? password;

  @override
  List<Object?> get props => [username, mail, name, password];
}
