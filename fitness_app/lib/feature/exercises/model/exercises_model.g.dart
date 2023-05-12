// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisesModel _$ExercisesModelFromJson(Map<String, dynamic> json) =>
    ExercisesModel(
      exercise: (json['exercise'] as List<dynamic>?)
          ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExercisesModelToJson(ExercisesModel instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      categoryName: json['categoryName'] as String?,
      imgUrl: json['imgUrl'] as String?,
      categoryData: (json['categoryData'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'categoryName': instance.categoryName,
      'imgUrl': instance.imgUrl,
      'categoryData': instance.categoryData,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      contentImage: json['contentImage'] as String?,
      type: json['type'] as String?,
      equipment: json['equipment'] as String?,
      mechanic: json['mechanic'] as String?,
      exerciseLevel: json['exerciseLevel'] as String?,
      exerciseName: json['exerciseName'] as String?,
      videoPageData: json['videoPageData'] == null
          ? null
          : VideoPageData.fromJson(
              json['videoPageData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'contentImage': instance.contentImage,
      'type': instance.type,
      'equipment': instance.equipment,
      'mechanic': instance.mechanic,
      'exerciseLevel': instance.exerciseLevel,
      'exerciseName': instance.exerciseName,
      'videoPageData': instance.videoPageData,
    };

VideoPageData _$VideoPageDataFromJson(Map<String, dynamic> json) =>
    VideoPageData(
      videoUrl: json['videoUrl'] as String?,
      fullBodyImage: json['fullBodyImage'] as String?,
      firstTitle: json['firstTitle'] as String?,
      firstContent: json['firstContent'] as String?,
      secondTitle: json['secondTitle'] as String?,
    );

Map<String, dynamic> _$VideoPageDataToJson(VideoPageData instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'fullBodyImage': instance.fullBodyImage,
      'firstTitle': instance.firstTitle,
      'firstContent': instance.firstContent,
      'secondTitle': instance.secondTitle,
    };
