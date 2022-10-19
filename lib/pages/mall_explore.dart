import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Widget/gridview_produk.dart';
import 'package:fashionizt/Widget/my_slideview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import 'package:badges/badges.dart';

class MallExplore extends StatefulWidget {

  const MallExplore({Key? key}) : super(key: key);

  @override
  State<MallExplore> createState() => _MallExploreState();
}

class _MallExploreState extends State<MallExplore> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();

  @override

  @override
  void initState() {
    _getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var keranjang = Provider.of<KeranjangProv>(context, listen: true);
    return RefreshIndicator(
      onRefresh: _getAllKeranjang,
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
            'Fashionizt',
            style: TitleApps,
          ),
            actions: [
              Center(
                child: keranjang.jumlah > 0 ? Badge(
                  badgeColor: Colors.orange,
                  animationType: BadgeAnimationType.slide,
                  borderSide: BorderSide(color: blush),
                  badgeContent: Text(
                    keranjang.jumlah.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  position: BadgePosition.topEnd(top: 0, end: 5),
                  child: IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                      onPressed: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return KeranjangProduk();
                            })
                        );
                      }),
                ) : IconButton(
                    icon: Icon(Icons.shopping_cart, size: 25, color: blush),
                    onPressed: ()
                    {
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
            SlideView(),
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            Text(
              "Explore Mall",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w800,
                color: blacksand,
                fontSize: 25,
              ),
            ),
            CategoryProduct(),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
              child: Row(
                children: [
                  Text('Recommended',
                      style: TextStyle(
                        color: blacksand,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('View All',
                        style: TextStyle(
                          color: blacksand,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
            ),
            GridViewProduk(),
          ],
        )),
      ),
    );
  }
  Future<void> _getAllKeranjang() async {
    var list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }
}
