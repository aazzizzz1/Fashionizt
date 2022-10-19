// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.status,
    required this.totalResults,
    required this.user,
  });

  String status;
  int totalResults;
  List<UserElement> user;

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"],
    totalResults: json["totalResults"],
    user: List<UserElement>.from(json["user"].map((x) => UserElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
  };
}

class UserElement {
  UserElement({
    required this.id,
    required this.nama,
    required this.username,
    required this.email,
    required this.password,
    required this.level,
  });

  String id;
  String nama;
  String username;
  String email;
  String password;
  String level;

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
    id: json["id"],
    nama: json["nama"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "username": username,
    "email": email,
    "password": password,
    "level": level,
  };
}

class Mydata{
  int id = 0;
  int IDUser = 0;
  String Username = "";
  String Email = "";
  String Level = "";

  setData(int id,int IDUser,String Username,String Email,String Level){
    this.id = id;
    this.Level = Level;
    this.IDUser = IDUser;
    this.Username = Username;
    this.Email = Email;
  }
}
