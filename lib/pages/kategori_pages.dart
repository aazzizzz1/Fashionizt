import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widget/gridview_kategori_produk.dart';
import '../theme.dart';
import 'package:badges/badges.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';

class KategoriPage extends StatefulWidget {
  String namaKategori;
  KategoriPage({
    required this.namaKategori,
  });

  @override
  State<KategoriPage> createState() => _KategoriPageState(namaKategori: namaKategori);
}

class _KategoriPageState extends State<KategoriPage> {
  String namaKategori;
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  var keranjang;

  _KategoriPageState({
    required this.namaKategori,
  });

  @override
  void initState() {
    getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    keranjang = Provider.of<KeranjangProv>(context, listen: true);
    return RefreshIndicator(
      onRefresh: getAllKeranjang,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: blacksand,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: blush,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Kategori $namaKategori',
              style: TitleApps,
            ),
            actions: [
              Center(
                child: listKeranjang.length > 0 ? Badge(
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
                  child: IconButton(
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
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10
                  ),
                ),
                GridViewKategoriProduk(nama_kategori: namaKategori),
              ],
            )),
      ),
    );
  }

  Future<void> getAllKeranjang() async {
    var list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }
}
