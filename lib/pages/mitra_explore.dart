import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Pages/pilih_mitra.dart';
import 'package:fashionizt/Widget/vertical_listview.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';
import 'package:fashionizt/pages/detail_mitra.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/category_product.dart';
import 'package:fashionizt/Widget/mitra_slideview.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import 'package:badges/badges.dart';

class MitraExplore extends StatefulWidget {
  const MitraExplore({Key? key}) : super(key: key);

  @override
  State<MitraExplore> createState() => _MitraExploreState();
}

class _MitraExploreState extends State<MitraExplore> {
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  @override
  late Future<Konveksi> _konveksi;
  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllKeranjang();
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var keranjang = Provider.of<KeranjangProv>(context, listen: true);
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return KeranjangProduk();
                          })
                      );
                    }),
              ) : IconButton(
                  icon: Icon(Icons.shopping_cart, size: 25, color: blush),
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
              MitraSlideView(),
              Container(
                margin: EdgeInsets.only(top: 20),
                //child: SubTittle(sub: "Kategori")
              ),
              Text(
                "Explore Mitra Produksi",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: blacksand,
                  fontSize: 25,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  //child: SubTittle(sub: "Kategori")
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
                            )),
                        Spacer(),
                        TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PilihKonveksi())
                              );
                            },
                            child: Text('View All',
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
                            future: _konveksi,
                            builder: (context, AsyncSnapshot<Konveksi> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.konveksi.length,
                                    itemBuilder: (context, index) {
                                      var konveksi = snapshot.data?.konveksi[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailMitra(konveksi: konveksi!);
                                                }));
                                          },
                                          child: VerticalListMitra(konveksi: konveksi!)
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
                        ]),
                  ],
                ),
              ),
            ],
          )),
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
