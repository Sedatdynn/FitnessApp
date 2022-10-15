class FoodsModel {
  List<Kategori>? kategori;

  FoodsModel({this.kategori});

  FoodsModel.fromJson(Map<String, dynamic> json) {
    if (json['kategori'] != null) {
      kategori = <Kategori>[];
      json['kategori'].forEach((v) {
        kategori!.add(Kategori.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (kategori != null) {
      data['kategori'] = kategori!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kategori {
  int? id;
  String? name;
  List<Icerik>? icerik;

  Kategori({this.id, this.name, this.icerik});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['icerik'] != null) {
      icerik = <Icerik>[];
      json['icerik'].forEach((v) {
        icerik!.add(Icerik.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (icerik != null) {
      data['icerik'] = icerik!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icerik {
  String? isim;
  dynamic? puan;
  bool? kontrol;

  Icerik({this.isim, this.puan, this.kontrol});

  Icerik.fromJson(Map<String, dynamic> json) {
    isim = json['isim'];
    puan = json['puan'];
    kontrol = json['kontrol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isim'] = isim;
    data['puan'] = puan;
    data['kontrol'] = kontrol;
    return data;
  }
}
