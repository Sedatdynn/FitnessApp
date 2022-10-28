import 'package:json_annotation/json_annotation.dart';
part "exercises_model.g.dart";

@JsonSerializable()
class ExercisesModel {
  List<Exercise>? exercise;

  ExercisesModel({this.exercise});

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return _$ExercisesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExercisesModelToJson(this);
  }
}

@JsonSerializable()
class Exercise {
  String? categoryName;
  String? imgUrl;
  List<CategoryData>? categoryData;

  Exercise({this.categoryName, this.imgUrl, this.categoryData});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return _$ExerciseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExerciseToJson(this);
  }
}

@JsonSerializable()
class CategoryData {
  String? contentImage;
  String? type;
  String? equipment;
  String? mechanic;
  String? exerciseLevel;
  String? exerciseName;
  VideoPageData? videoPageData;

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

  Map<String, dynamic> toJson() {
    return _$CategoryDataToJson(this);
  }
}

@JsonSerializable()
class VideoPageData {
  String? videoUrl;
  String? fullBodyImage;
  String? firstTitle;
  String? firstContent;
  String? secondTitle;

  VideoPageData(
      {this.videoUrl,
      this.fullBodyImage,
      this.firstTitle,
      this.firstContent,
      this.secondTitle});

  factory VideoPageData.fromJson(Map<String, dynamic> json) {
    return _$VideoPageDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideoPageDataToJson(this);
  }
}
