class ExercisesModel {
  List<Exercise>? exercise;

  ExercisesModel({this.exercise});

  ExercisesModel.fromJson(Map<String, dynamic> json) {
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exercise != null) {
      data['exercise'] = exercise!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  String? categoryName;
  String? imgUrl;
  List<CategoryData>? categoryData;

  Exercise({this.categoryName, this.imgUrl, this.categoryData});

  Exercise.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    imgUrl = json['imgUrl'];
    if (json['categoryData'] != null) {
      categoryData = <CategoryData>[];
      json['categoryData'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['imgUrl'] = imgUrl;
    if (categoryData != null) {
      data['categoryData'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

  CategoryData.fromJson(Map<String, dynamic> json) {
    contentImage = json['contentImage'];
    type = json['type'];
    equipment = json['equipment'];
    mechanic = json['mechanic'];
    exerciseLevel = json['exerciseLevel'];
    exerciseName = json['exerciseName'];
    videoPageData = json['videoPageData'] != null
        ? VideoPageData.fromJson(json['videoPageData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contentImage'] = contentImage;
    data['type'] = type;
    data['equipment'] = equipment;
    data['mechanic'] = mechanic;
    data['exerciseLevel'] = exerciseLevel;
    data['exerciseName'] = exerciseName;
    if (videoPageData != null) {
      data['videoPageData'] = videoPageData!.toJson();
    }
    return data;
  }
}

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

  VideoPageData.fromJson(Map<String, dynamic> json) {
    videoUrl = json['videoUrl'];
    fullBodyImage = json['fullBodyImage'];
    firstTitle = json['firstTitle'];
    firstContent = json['firstContent'];
    secondTitle = json['secondTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoUrl'] = videoUrl;
    data['fullBodyImage'] = fullBodyImage;
    data['firstTitle'] = firstTitle;
    data['firstContent'] = firstContent;
    data['secondTitle'] = secondTitle;
    return data;
  }
}
