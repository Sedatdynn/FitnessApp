import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part "foods_model.g.dart";

@JsonSerializable(createToJson: false)
class FoodsModel extends BaseModel<FoodsModel> {
  final List<Kategori>? kategori;

  FoodsModel({this.kategori});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$FoodsModelFromJson(json);
  }

  @override
  List<Object?> get props => [];
}

@JsonSerializable(createToJson: false)
class Kategori extends BaseModel<Kategori> {
  final int? id;
  final String? name;
  final List<Icerik>? icerik;

  Kategori({this.id, this.name, this.icerik});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return _$KategoriFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [id, name, icerik];
}

@JsonSerializable(createToJson: false)
class Icerik extends BaseModel<Icerik> {
  final String? isim;
  final dynamic puan;
  bool? kontrol;

  Icerik({this.isim, this.puan, this.kontrol});

  factory Icerik.fromJson(Map<String, dynamic> json) {
    return _$IcerikFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [isim, puan, kontrol];
}
