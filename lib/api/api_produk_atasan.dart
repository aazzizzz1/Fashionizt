// To parse this JSON data, do
//
//     final produkAtasan = produkAtasanFromJson(jsonString);

import 'dart:convert';

ProdukAtasan produkAtasanFromJson(String str) => ProdukAtasan.fromJson(json.decode(str));

String produkAtasanToJson(ProdukAtasan data) => json.encode(data.toJson());

class ProdukAtasan {
  ProdukAtasan({
    required this.status,
    required this.totalResults,
    required this.produk,
  });

  String status;
  int totalResults;
  List<Produk> produk;

  factory ProdukAtasan.fromJson(Map<String, dynamic> json) => ProdukAtasan(
    status: json["status"],
    totalResults: json["totalResults"],
    produk: List<Produk>.from(json["produk"].map((x) => Produk.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "produk": List<dynamic>.from(produk.map((x) => x.toJson())),
  };
}

class Produk {
  Produk({
    required this.imgProduk,
    required this.imgProcessing,
  });

  String imgProduk;
  String imgProcessing;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    imgProduk: json["img_produk"],
    imgProcessing: json["img_processing"],
  );

  Map<String, dynamic> toJson() => {
    "img_produk": imgProduk,
    "img_processing": imgProcessing,
  };
}
