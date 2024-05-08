// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisesModel _$ExercisesModelFromJson(Map<String, dynamic> json) => ExercisesModel(
      exercise: (json['exercise'] as List<dynamic>?)
          ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      categoryName: json['categoryName'] as String?,
      imgUrl: json['imgUrl'] as String?,
      categoryData: (json['categoryData'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      contentImage: json['contentImage'] as String?,
      type: json['type'] as String?,
      equipment: json['equipment'] as String?,
      mechanic: json['mechanic'] as String?,
      exerciseLevel: json['exerciseLevel'] as String?,
      exerciseName: json['exerciseName'] as String?,
      videoPageData: json['videoPageData'] == null
          ? null
          : VideoPageData.fromJson(json['videoPageData'] as Map<String, dynamic>),
    );

VideoPageData _$VideoPageDataFromJson(Map<String, dynamic> json) => VideoPageData(
      videoUrl: json['videoUrl'] as String?,
      fullBodyImage: json['fullBodyImage'] as String?,
      firstTitle: json['firstTitle'] as String?,
      firstContent: json['firstContent'] as String?,
      secondTitle: json['secondTitle'] as String?,
    );
