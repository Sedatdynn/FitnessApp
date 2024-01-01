import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "foods_model.g.dart";

@JsonSerializable(createToJson: false)
class FoodsModel extends Equatable {
  final List<Kategori>? kategori;

  const FoodsModel({this.kategori});

  fromJson(Map<String, dynamic> json) {
    return _$FoodsModelFromJson(json);
  }

  @override
  List<Object?> get props => [];
}

@JsonSerializable(createToJson: false)
class Kategori extends Equatable {
  final int? id;
  final String? name;
  final List<Icerik>? icerik;

  const Kategori({this.id, this.name, this.icerik});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return _$KategoriFromJson(json);
  }

  @override
  List<Object?> get props => [id, name, icerik];
}

@JsonSerializable(createToJson: false)
class Icerik extends Equatable {
  final String? isim;
  final dynamic puan;
  final bool? kontrol;

  const Icerik({this.isim, this.puan, this.kontrol});

  factory Icerik.fromJson(Map<String, dynamic> json) {
    return _$IcerikFromJson(json);
  }

  @override
  List<Object?> get props => [isim, puan, kontrol];

  Icerik copyWith({
    String? isim,
    dynamic puan,
    bool? kontrol,
  }) {
    return Icerik(
      isim: isim ?? this.isim,
      puan: puan ?? this.puan,
      kontrol: kontrol ?? this.kontrol,
    );
  }
}
