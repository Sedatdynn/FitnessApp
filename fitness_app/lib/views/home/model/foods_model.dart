import 'package:json_annotation/json_annotation.dart';

part "foods_model.g.dart";

@JsonSerializable()
class FoodsModel {
  List<Kategori>? kategori;

  FoodsModel({this.kategori});

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return _$FoodsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FoodsModelToJson(this);
  }
}

@JsonSerializable()
class Kategori {
  final int? id;
  final String? name;
  final List<Icerik>? icerik;

  Kategori({this.id, this.name, this.icerik});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return _$KategoriFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$KategoriToJson(this);
  }
}

@JsonSerializable()
class Icerik {
  final String? isim;
  final dynamic puan;
  bool? kontrol;

  Icerik({this.isim, this.puan, this.kontrol});

  factory Icerik.fromJson(Map<String, dynamic> json) {
    return _$IcerikFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IcerikToJson(this);
  }
}
