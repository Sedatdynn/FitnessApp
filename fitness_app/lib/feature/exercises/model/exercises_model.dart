import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "exercises_model.g.dart";

@JsonSerializable(createToJson: false)
class ExercisesModel extends Equatable {
  final List<Exercise>? exercise;

  const ExercisesModel({this.exercise});

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return _$ExercisesModelFromJson(json);
  }

  @override
  List<Object?> get props => [];
}

@JsonSerializable(createToJson: false)
class Exercise extends Equatable {
  final String? categoryName;
  final String? imgUrl;
  final List<CategoryData>? categoryData;

  const Exercise({this.categoryName, this.imgUrl, this.categoryData});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return _$ExerciseFromJson(json);
  }

  @override
  List<Object?> get props => [categoryName, imgUrl, categoryData];
}

@JsonSerializable(createToJson: false)
class CategoryData extends Equatable {
  final String? contentImage;
  final String? type;
  final String? equipment;
  final String? mechanic;
  final String? exerciseLevel;
  final String? exerciseName;
  final VideoPageData? videoPageData;

  const CategoryData(
      {this.contentImage,
      this.type,
      this.equipment,
      this.mechanic,
      this.exerciseLevel,
      this.exerciseName,
      this.videoPageData});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return _$CategoryDataFromJson(json);
  }

  @override
  List<Object?> get props => [
        contentImage,
        type,
        equipment,
        mechanic,
        exerciseLevel,
        exerciseName,
        videoPageData,
      ];
}

@JsonSerializable(createToJson: false)
class VideoPageData extends Equatable {
  final String? videoUrl;
  final String? fullBodyImage;
  final String? firstTitle;
  final String? firstContent;
  final String? secondTitle;

  const VideoPageData(
      {this.videoUrl, this.fullBodyImage, this.firstTitle, this.firstContent, this.secondTitle});

  factory VideoPageData.fromJson(Map<String, dynamic> json) {
    return _$VideoPageDataFromJson(json);
  }

  @override
  List<Object?> get props => [videoUrl, fullBodyImage, firstTitle, firstContent, secondTitle];
}
