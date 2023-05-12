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

Map<String, dynamic> _$FoodsModelToJson(FoodsModel instance) =>
    <String, dynamic>{
      'kategori': instance.kategori,
    };

Kategori _$KategoriFromJson(Map<String, dynamic> json) => Kategori(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icerik: (json['icerik'] as List<dynamic>?)
          ?.map((e) => Icerik.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KategoriToJson(Kategori instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icerik': instance.icerik,
    };

Icerik _$IcerikFromJson(Map<String, dynamic> json) => Icerik(
      isim: json['isim'] as String?,
      puan: json['puan'],
      kontrol: json['kontrol'] as bool?,
    );

Map<String, dynamic> _$IcerikToJson(Icerik instance) => <String, dynamic>{
      'isim': instance.isim,
      'puan': instance.puan,
      'kontrol': instance.kontrol,
    };
