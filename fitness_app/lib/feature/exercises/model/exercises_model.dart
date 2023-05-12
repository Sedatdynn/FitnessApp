import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part "exercises_model.g.dart";

@JsonSerializable(createToJson: false)
class ExercisesModel extends BaseModel<ExercisesModel> {
  final List<Exercise>? exercise;

  ExercisesModel({this.exercise});

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return _$ExercisesModelFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [];
}

@JsonSerializable(createToJson: false)
class Exercise extends BaseModel<Exercise> {
  final String? categoryName;
  final String? imgUrl;
  final List<CategoryData>? categoryData;

  Exercise({this.categoryName, this.imgUrl, this.categoryData});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return _$ExerciseFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [categoryName, imgUrl, categoryData];
}

@JsonSerializable(createToJson: false)
class CategoryData extends BaseModel<CategoryData> {
  final String? contentImage;
  final String? type;
  final String? equipment;
  final String? mechanic;
  final String? exerciseLevel;
  final String? exerciseName;
  final VideoPageData? videoPageData;

  CategoryData(
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
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
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
class VideoPageData extends BaseModel<VideoPageData> {
  final String? videoUrl;
  final String? fullBodyImage;
  final String? firstTitle;
  final String? firstContent;
  final String? secondTitle;

  VideoPageData(
      {this.videoUrl,
      this.fullBodyImage,
      this.firstTitle,
      this.firstContent,
      this.secondTitle});

  factory VideoPageData.fromJson(Map<String, dynamic> json) {
    return _$VideoPageDataFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props =>
      [videoUrl, fullBodyImage, firstTitle, firstContent, secondTitle];
}
