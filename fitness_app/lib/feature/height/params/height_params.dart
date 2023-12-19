import 'package:equatable/equatable.dart';

class HeightParams extends Equatable {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String? gender;
  final int? birthYear;
  final String? mobility;

  const HeightParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
    required this.gender,
    required this.birthYear,
    required this.mobility,
  });

  @override
  List<Object?> get props => [username, mail, name, password, gender, birthYear, mobility];
}
