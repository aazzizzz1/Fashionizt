// To parse this JSON data, do
//
//     final desainer = desainerFromJson(jsonString);

import 'dart:convert';

Desainer desainerFromJson(String str) => Desainer.fromJson(json.decode(str));

String desainerToJson(Desainer data) => json.encode(data.toJson());

class Desainer {
  Desainer({
    required this.status,
    required this.totalResults,
    required this.desainer,
  });

  String status;
  int totalResults;
  List<DesainerElement> desainer;

  factory Desainer.fromJson(Map<String, dynamic> json) => Desainer(
    status: json["status"],
    totalResults: json["totalResults"],
    desainer: List<DesainerElement>.from(json["desainer"].map((x) => DesainerElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "desainer": List<dynamic>.from(desainer.map((x) => x.toJson())),
  };
}

class DesainerElement {
  DesainerElement({
    required this.id,
    required this.imgProfil,
    required this.nama,
    required this.bio,
    required this.rating,
    required this.linkWa,
    required this.linkPorto,
    required this.gender,
    required this.jmlhProject,
    required this.kategori,
    required this.tarif,
  });

  String id;
  String imgProfil;
  String nama;
  String bio;
  String rating;
  String linkWa;
  String linkPorto;
  String gender;
  String jmlhProject;
  String kategori;
  String tarif;

  factory DesainerElement.fromJson(Map<String, dynamic> json) => DesainerElement(
    id: json["id"],
    imgProfil: json["img_profil"],
    nama: json["nama"],
    bio: json["bio"],
    rating: json["rating"],
    linkWa: json["link_wa"],
    linkPorto: json["link_porto"],
    gender: json["gender"],
    jmlhProject: json["jmlh_project"],
    kategori: json["kategori"],
    tarif: json["tarif"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profil": imgProfil,
    "nama": nama,
    "bio": bio,
    "rating": rating,
    "link_wa": linkWa,
    "link_porto": linkPorto,
    "gender": gender,
    "jmlh_project": jmlhProject,
    "kategori": kategori,
    "tarif": tarif,
  };
}