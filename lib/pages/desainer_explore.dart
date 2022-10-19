import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Pages/pilih_desainer.dart';
import 'package:fashionizt/Widget/desainer_slideview.dart';
import 'package:fashionizt/Widget/vertical_listview.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Api/api_short_desainer.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import 'package:badges/badges.dart';

class DesainerExplore extends StatefulWidget {
  const DesainerExplore({Key? key}) : super(key: key);

  @override
  State<DesainerExplore> createState() => _DesainerExploreState();
}

class _DesainerExploreState extends State<DesainerExplore> {
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  var keranjang;
  var state;
  var desainer;
  var list;

  @override
  late Future<Desainer> _desainer;

  @override
  void initState() {
    GetAllKeranjang();
    super.initState();
    _desainer = ApiServiceDes().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    keranjang = Provider.of<KeranjangProv>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Fashionizt',
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
              child: IconButton(icon: Icon(
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
                  }),
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
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DesainerSlideView(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              Text(
                "Explore Desainer",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: blacksand,
                  fontSize: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
              ),
              CategoryProduct(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: blacksand,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PilihDesainer())
                            );
                          },
                          child: Text(
                              'View All',
                              style: TextStyle(
                                color: blacksand,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FutureBuilder(
                            future: _desainer,
                            builder: (context, AsyncSnapshot<Desainer> snapshot) {
                              state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.desainer.length,
                                    itemBuilder: (context, index) {
                                      desainer = snapshot.data?.desainer[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailDesainer(desainer: desainer!);
                                                }));
                                          },
                                          child: VerticalListDesainer(desainer: desainer!)
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(child: Text(snapshot.error.toString()));
                                } else {
                                  return Text('');
                                }
                              }
                            },
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          )
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
}