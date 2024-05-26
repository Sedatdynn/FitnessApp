// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodsModel _$FoodsModelFromJson(Map<String, dynamic> json) => FoodsModel(
      category: (json['kategori'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      content: (json['icerik'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      name: json['isim'] as String?,
      score: (json['puan'] as num?)?.toDouble(),
      control: json['kontrol'] as bool?,
    );
