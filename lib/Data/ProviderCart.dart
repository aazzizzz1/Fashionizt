import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
// import 'package:fashionizt/Models/Cart.dart';
import 'package:flutter/cupertino.dart';

class KeranjangProv with ChangeNotifier{
  int jumlah = 0;

  Future<int> getJumlah() async{
    jumlah = await _getAllKeranjang();
    return jumlah;
  }

  jumlahplus()async{
    jumlah = await _getAllKeranjang();
    notifyListeners();
  }
}
class FittingRoomProv with ChangeNotifier{
  int status = 0;

  setStatus(int kode){
    status = kode;
  }
  int getStatus(){
    return status;
  }
}
Future<int> _getAllKeranjang() async{
  DbHelper db = DbHelper();
  List<CartShop> listKeranjang = [];
  var list = await db.getAllKeranjang();
  listKeranjang.clear();
  list!.forEach((keranjang) {
    listKeranjang.add(CartShop.fromMap(keranjang));
  });
  return listKeranjang.length;
}