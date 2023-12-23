import 'package:equatable/equatable.dart';

class CalculateParams extends Equatable {
  final String? gender;
  final int? birthYear;
  final String? mobility;
  final int? height;

  const CalculateParams({
    required this.gender,
    required this.birthYear,
    required this.mobility,
    required this.height,
  });

  @override
  List<Object?> get props => [gender, birthYear, mobility, height];
}
