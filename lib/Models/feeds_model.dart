// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Feeds produkFromJson(String str) => Feeds.fromJson(json.decode(str));

String produkToJson(Feeds data) => json.encode(data.toJson());

class Feeds {
  Feeds({
    required this.status,
    required this.totalResults,
    required this.feeds,
  });

  String status;
  int totalResults;
  List<FeedsElement> feeds;

  factory Feeds.fromJson(Map<String, dynamic> json) => Feeds(
    status: json["status"],
    totalResults: json["totalResults"],
    feeds: List<FeedsElement>.from(json["feeds"].map((x) => FeedsElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "feeds": List<dynamic>.from(feeds.map((x) => x.toJson())),
  };
}

class FeedsElement {
  FeedsElement({
    required this.id,
    required this.nama,
    required this.imgProduk,
    required this.harga,
    required this.rating,
    required this.deskripsi,
    required this.idDesainer,
    required this.imgDesainer,
    required this.namaDesainer,
    required this.bioDesainer,
    required this.ratingDesainer,
    required this.waDesainer,
    required this.portoDesainer,
    required this.projekDesainer,
    required this.kategoriDesainer,
  });

  String id;
  String nama;
  String imgProduk;
  String harga;
  String rating;
  String deskripsi;
  String namaDesainer;
  String idDesainer;
  String imgDesainer;
  String bioDesainer;
  String ratingDesainer;
  String waDesainer;
  String portoDesainer;
  String projekDesainer;
  String kategoriDesainer;

  factory FeedsElement.fromJson(Map<String, dynamic> json) => FeedsElement(
    id: json["id"],
    nama: json["nama"],
    imgProduk: json["img_produk"],
    harga: json["harga"],
    rating: json["rating"],
    deskripsi: json["deskripsi"],
    namaDesainer: json["nama_desainer"],
    idDesainer: json["id_desainer"],
    imgDesainer: json["img_profil"],
    bioDesainer: json["bio_desainer"],
    ratingDesainer: json["rating_desainer"],
    waDesainer: json["link_wa"],
    portoDesainer: json["link_porto"],
    projekDesainer: json["jmlh_project"],
    kategoriDesainer: json["kategori"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "img_produk": imgProduk,
    // "harga": harga,
    // "rating": rating,
    // "deskripsi": deskripsi,
    "id_desainer": idDesainer,
    // "nama_desainer": namaDesainer,
    // "img_profil": imgDesainer,
    // "bio_desainer": bioDesainer,
    // "rating_desainer": ratingDesainer,
    // "link_wa": waDesainer,
    // "link_porto": portoDesainer,
    // "jmlh_project": projekDesainer,
    // "kategori": kategoriDesainer,
  };
}