import 'package:equatable/equatable.dart';

class HeightParams extends Equatable {
  const HeightParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
    required this.gender,
    required this.birthYear,
    required this.mobility,
  });
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String? gender;
  final int? birthYear;
  final String? mobility;

  @override
  List<Object?> get props => [username, mail, name, password, gender, birthYear, mobility];
}
