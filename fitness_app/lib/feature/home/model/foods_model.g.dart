// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodsModel _$FoodsModelFromJson(Map<String, dynamic> json) => FoodsModel(
      kategori: (json['kategori'] as List<dynamic>?)
          ?.map((e) => Kategori.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Kategori _$KategoriFromJson(Map<String, dynamic> json) => Kategori(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icerik: (json['icerik'] as List<dynamic>?)
          ?.map((e) => Icerik.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Icerik _$IcerikFromJson(Map<String, dynamic> json) => Icerik(
      isim: json['isim'] as String?,
      puan: json['puan'],
      kontrol: json['kontrol'] as bool?,
    );
