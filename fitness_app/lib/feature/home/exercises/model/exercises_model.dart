import 'package:equatable/equatable.dart';
import 'package:fistness_app_firebase/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercises_model.g.dart';

@JsonSerializable(createToJson: false)
class ExercisesModel extends BaseModel<ExercisesModel> {
  ExercisesModel({this.exercise});
  final List<Exercise>? exercise;

  @override
  ExercisesModel fromJson(Map<String, dynamic> json) => _$ExercisesModelFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => {};
}

@JsonSerializable(createToJson: false)
class Exercise extends Equatable {
  const Exercise({this.categoryName, this.imgUrl, this.categoryData});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return _$ExerciseFromJson(json);
  }
  final String? categoryName;
  final String? imgUrl;
  final List<CategoryData>? categoryData;

  @override
  List<Object?> get props => [categoryName, imgUrl, categoryData];
}

@JsonSerializable(createToJson: false)
class CategoryData extends Equatable {
  const CategoryData({
    this.contentImage,
    this.type,
    this.equipment,
    this.mechanic,
    this.exerciseLevel,
    this.exerciseName,
    this.videoPageData,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return _$CategoryDataFromJson(json);
  }
  final String? contentImage;
  final String? type;
  final String? equipment;
  final String? mechanic;
  final String? exerciseLevel;
  final String? exerciseName;
  final VideoPageData? videoPageData;

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
  const VideoPageData({
    this.videoUrl,
    this.fullBodyImage,
    this.firstTitle,
    this.firstContent,
    this.secondTitle,
  });

  factory VideoPageData.fromJson(Map<String, dynamic> json) {
    return _$VideoPageDataFromJson(json);
  }
  final String? videoUrl;
  final String? fullBodyImage;
  final String? firstTitle;
  final String? firstContent;
  final String? secondTitle;

  @override
  List<Object?> get props => [videoUrl, fullBodyImage, firstTitle, firstContent, secondTitle];
}
