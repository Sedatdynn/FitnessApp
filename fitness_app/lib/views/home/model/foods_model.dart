class FoodsModel {
  List<Kategori>? kategori;

  FoodsModel({this.kategori});

  FoodsModel.fromJson(Map<String, dynamic> json) {
    if (json['kategori'] != null) {
      kategori = <Kategori>[];
      json['kategori'].forEach((v) {
        kategori!.add(new Kategori.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.map((v) => v.toJson()).toList();
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
        icerik!.add(new Icerik.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.icerik != null) {
      data['icerik'] = this.icerik!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icerik {
  String? isim;
  int? puan;
  bool? kontrol;

  Icerik({this.isim, this.puan, this.kontrol});

  Icerik.fromJson(Map<String, dynamic> json) {
    isim = json['isim'];
    puan = json['puan'];
    kontrol = json['kontrol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isim'] = this.isim;
    data['puan'] = this.puan;
    data['kontrol'] = this.kontrol;
    return data;
  }
}
