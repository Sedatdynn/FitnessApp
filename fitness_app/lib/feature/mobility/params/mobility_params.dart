import 'package:equatable/equatable.dart';

class MobilityParams extends Equatable {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String? gender;
  final int? birthYear;

  const MobilityParams({
    required this.username,
    required this.mail,
    required this.name,
    required this.password,
    required this.gender,
    required this.birthYear,
  });

  @override
  List<Object?> get props => [username, mail, name, password, gender, birthYear];
}
