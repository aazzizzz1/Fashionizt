class UserList{
  late int? id;
  late int IDUser;
  late String Username;
  late String Email;
  late String Level;

  UserList({
    this.id,
    required this.IDUser,
    required this.Email,
    required this.Level,
    required this.Username,
  });

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();

    if(id != null){
      map['Id'] = id;
    }
    map['IDUser'] = IDUser;
    map['Email'] = Email;
    map['Username'] = Username;
    map['Level'] = Level;

    return map;
  }

  UserList.fromMap(Map<String,dynamic> map){
    this.id = map['Id'];
    this.IDUser = map['IDUser'];
    this.Username = map['Username'];
    this.Level = map['Level'];
    this.Email = map['Email'];
  }
}