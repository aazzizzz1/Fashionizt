// To parse this JSON data, do
//
//     final produkBawahan = produkBawahanFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProdukBawahan produkBawahanFromJson(String str) => ProdukBawahan.fromJson(json.decode(str));

String produkBawahanToJson(ProdukBawahan data) => json.encode(data.toJson());

class ProdukBawahan {
  ProdukBawahan({
    required this.status,
    required this.totalResults,
    required this.produk,
  });

  String status;
  int totalResults;
  List<Produk> produk;

  factory ProdukBawahan.fromJson(Map<String, dynamic> json) => ProdukBawahan(
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
