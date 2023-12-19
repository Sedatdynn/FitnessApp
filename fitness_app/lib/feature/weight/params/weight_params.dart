import 'package:equatable/equatable.dart';

class WeightParams extends Equatable {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String? gender;
  final int? birthYear;
  final String? mobility;
  final int? height;

  const WeightParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
    required this.gender,
    required this.birthYear,
    required this.mobility,
    required this.height,
  });

  @override
  List<Object?> get props => [username, mail, name, password, gender, birthYear, mobility, height];
}
