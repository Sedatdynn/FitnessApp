import 'package:equatable/equatable.dart';

class CalculateParams extends Equatable {
  const CalculateParams({
    required this.gender,
    required this.birthYear,
    required this.mobility,
    required this.height,
  });
  final String? gender;
  final int? birthYear;
  final String? mobility;
  final int? height;

  @override
  List<Object?> get props => [gender, birthYear, mobility, height];
}
