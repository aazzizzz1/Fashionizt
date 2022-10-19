import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/Widget/button_role.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/sub_tittle.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/horizontal_mitra_listview.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/Widget/horizontal_desainer_listview.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../shared_preferences.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../variabels.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var dataUser;
  var namaUser;
  var keranjang;
  var list;
  var user;
  final PrefService _prefService = PrefService();
  List<CartShop> listKeranjang = [];
  List<UserList> listUser = [];
  DbHelper db = DbHelper();
  DbHelperUser dbu = DbHelperUser();

  @override
  void initState(){
    GetAllKeranjang();
    GetUser();
    _prefService.readCache("username").then((value) {
      namaUser = value.toString().split(' ');
      Akun(namaUser[namaUser.length-1]);
      print('username : ' + value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    keranjang = Provider.of<KeranjangProv>(context, listen: true);
    keranjang.jumlahplus();

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              title: const Text('Exit App'),
              content: const Text('Are you sure to exit the app?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Yes',
                    style: TextStyle(
                      color: blacksand,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('No',
                    style: TextStyle(
                    color: blacksand,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            );
          },
        );
        return shouldPop!;
      },

      child: Scaffold(
        appBar: AppBar(
            backgroundColor: blacksand,
            elevation: 0,
            title: Text(
              'Fashionizt',
              style: TitleApps,
            ),
            automaticallyImplyLeading: false,
            actions: [
              Center(
                child: keranjang.jumlah > 0 ? Badge(
                  badgeColor: Colors.orange,
                  animationType: BadgeAnimationType.slide,
                  borderSide: BorderSide(color: blush),
                  badgeContent: Text(
                    keranjang.jumlah.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                    ),
                  ),
                  position: BadgePosition.topEnd(top: 0, end: 5),
                  child: IconButton(icon: Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: blush
                  ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return KeranjangProduk();
                            })
                        );
                      }
                  ),
                ) : IconButton(
                    icon: Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: blush
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return KeranjangProduk();
                          })
                      );
                    }
                ),
              )
            ]
        ),

        body: Container(
          child: ListView(
            children: [
              SlideView(),
              Role(),
              SubTittle(sub: "Top Desainer"),
              HorizontalDesainerListView(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              SubTittle(sub: "Top Mitra Produksi"),
              HorizontalMitraListView(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              SubTittle(sub: "Rekomendasi Produk",),
              GridViewProduk(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> GetAllKeranjang() async {
    list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }

  Future<void> insertUser (String DataPack) async {
    user = DataPack.split(' ');
    if(listUser.length == 0){
      String tingkat = "";
      if(user[3] == "customer"){
        tingkat = "Customer";
      }else if(user[3] == "designer"){
        tingkat = "Desainer";
      }else{
        tingkat = "Mitra Produksi";
      }
      await dbu.saveUser(UserList(
        IDUser: int.parse(user[0]),
        Username: user[1],
        Email: user[2],
        Level: tingkat,
      ));
    }else{
      await dbu.updateUser(UserList.fromMap({
        'Id' : 0,
        'IDUser' : int.parse(user[0]),
        'Username' : user[1],
        'Email' : user[2],
        'Level' : user[3],
      }));
    }
    setState(() {
      IDUserGlob = user[0];
      GetUser();
    });
  }

  Future<void> GetUser() async{
    list = await dbu.getUser();
    listUser.clear();
    setState(() {
      list!.forEach((user) {
        listUser.add(UserList.fromMap(user));
      });
    });
  }

  Future<void> Akun(String Username) async{
    final response = await http.post(
        Uri.parse(
            'https://fashionizt.yufagency.com/user.php'),
        body: {"username" : Username}
    );
    setState(() {
      dataUser = json.decode(response.body);
      insertUser(dataUser.toString());
    });
  }
}