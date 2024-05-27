// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/base/model/base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foods_model.g.dart';

@JsonSerializable(createToJson: false)
class FoodsModel extends BaseModel<FoodsModel> {
  FoodsModel({this.category});
  @JsonKey(name: 'kategori')
  final List<Category>? category;

  @override
  FoodsModel fromJson(Map<String, dynamic> json) => _$FoodsModelFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => {};
}

@JsonSerializable(createToJson: false)
class Category extends Equatable {
  const Category({this.id, this.name, this.content});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }
  final int? id;
  final String? name;
  @JsonKey(name: 'icerik')
  final List<Content>? content;

  @override
  List<Object?> get props => [id, name, content];

  Category copyWith({
    int? id,
    String? name,
    List<Content>? content,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
    );
  }
}

@JsonSerializable(createToJson: false)
class Content extends Equatable {
  const Content({this.name, this.score, this.control});

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }
  @JsonKey(name: 'isim')
  final String? name;
  @JsonKey(name: 'puan')
  final double? score;
  @JsonKey(name: 'kontrol')
  final bool? control;

  @override
  List<Object?> get props => [name, score, control];

  Content copyWith({
    String? name,
    double? score,
    bool? control,
  }) {
    return Content(
      name: name ?? this.name,
      score: score ?? this.score,
      control: control ?? this.control,
    );
  }
}
