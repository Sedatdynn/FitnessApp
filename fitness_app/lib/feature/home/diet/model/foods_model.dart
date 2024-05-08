import 'package:equatable/equatable.dart';
import 'package:fistness_app_firebase/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foods_model.g.dart';

@JsonSerializable(createToJson: false)
class FoodsModel extends BaseModel<FoodsModel> {
  FoodsModel({this.kategori});
  final List<Kategori>? kategori;

  @override
  FoodsModel fromJson(Map<String, dynamic> json) {
    return _$FoodsModelFromJson(json);
  }

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => {};
}

@JsonSerializable(createToJson: false)
class Kategori extends Equatable {
  const Kategori({this.id, this.name, this.icerik});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return _$KategoriFromJson(json);
  }
  final int? id;
  final String? name;
  final List<Icerik>? icerik;

  @override
  List<Object?> get props => [id, name, icerik];
}

@JsonSerializable(createToJson: false)
class Icerik extends Equatable {
  const Icerik({this.isim, this.puan, this.kontrol});

  factory Icerik.fromJson(Map<String, dynamic> json) {
    return _$IcerikFromJson(json);
  }
  final String? isim;
  final double? puan;
  final bool? kontrol;

  @override
  List<Object?> get props => [isim, puan, kontrol];

  Icerik copyWith({
    String? isim,
    double? puan,
    bool? kontrol,
  }) {
    return Icerik(
      isim: isim ?? this.isim,
      puan: puan ?? this.puan,
      kontrol: kontrol ?? this.kontrol,
    );
  }
}
