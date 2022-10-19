class CartShop{
  late int? id;
  late String NamaProduk;
  late String Harga;
  late String Gambar;
  late int Jumlah;
  late int Status;

  CartShop(
      {
        this.id,
        required this.NamaProduk,
        required this.Harga,
        required this.Gambar,
        required this.Jumlah,
        required this.Status,
      });

  Map<String,dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id != null){
      map['Id'] = id;
    }
    map['NamaProduk'] = NamaProduk;
    map['Harga'] = Harga;
    map['Gambar'] = Gambar;
    map['Jumlah'] = Jumlah;
    map['Status'] = Status;
    return map;
  }

  CartShop.fromMap(Map<String,dynamic> map){
    this.id = map['Id'];
    this.NamaProduk = map['NamaProduk'];
    this.Harga = map['Harga'];
    this.Gambar = map['Gambar'];
    this.Jumlah = map['Jumlah'];
    this.Status = map['Status'];
  }
}