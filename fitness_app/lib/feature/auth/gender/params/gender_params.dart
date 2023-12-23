import 'package:equatable/equatable.dart';

class GenderParams extends Equatable {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;

  const GenderParams(
      {required this.username, required this.mail, required this.name, required this.password});

  @override
  List<Object?> get props => [username, mail, name, password];
}
