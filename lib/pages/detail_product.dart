import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/pages/fitting_room.dart';
import 'package:fashionizt/pages/keranjang_produk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:badges/badges.dart';


class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key,required this.detail,this.keranjang}) : super(key: key);
  final CartShop? keranjang;
  final ProdukElement detail;

  @override
  _DetailProductState createState() => _DetailProductState(detail: detail);
}

class _DetailProductState extends State<DetailProduct> {
  _DetailProductState({required this.detail});
  final ProdukElement detail;
  DbHelper db = DbHelper();

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState(){
    _getAllKeranjang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var keranjang = Provider.of<KeranjangProv>(context);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
         decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                 BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,3),
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ]
          ),
          height: size.height*0.06,
          child: Row(
            children: [
             Container(
              width: size.width*0.2,
              alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_outlined, color: blacksand),
                  iconSize: 25.0,
                  onPressed: () {
                    upsertKeranjang(detail.nama);
                    setState(() {
                      _getAllKeranjang();
                      keranjang.jumlahplus();
                    });
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Berhasil',
                      text: 'Dimasukkan ke Keranjang',
                      backgroundColor: Colors.grey,
                      confirmBtnColor: blacksand,
                      confirmBtnTextStyle: TextStyle(color: blush, fontWeight:FontWeight.w600,fontSize: 18.0),
                    );
                  },
                ),
              ),
              Container(
                width: size.width*0.2,
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.accessibility_outlined, color: blacksand),
                  iconSize: 25.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return FittingRoom();
                        })
                    );
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Berhasil',
                      text: 'Ditampilkan ke Fitting Room',
                      backgroundColor: Colors.grey,
                      confirmBtnColor: blacksand,
                      confirmBtnTextStyle: TextStyle(color: blush, fontWeight:FontWeight.w600,fontSize: 18.0),
                    );
                  },
                ),
              ),
              Container(
                width: size.width*0.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blacksand,
                ),
                child:  TextButton(
                  onPressed: () {
                    _launchURL('https://api.whatsapp.com/send?phone=6285808322783&text=Transaksi%20akan%20dialihkan%20ke%20admin%20Fashionizt');
                  },
                  child: Text('Buy Now',style: TextStyle(color: blush,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Stack(
          children: <Widget>[
            ElevatedButton(
                child: Icon(Icons.arrow_back_ios_rounded, size: 25),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(5),
                  primary: Colors.black38,
                  onPrimary: Colors.white,
                ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]
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
                position: BadgePosition.topEnd(top: 0, end: 13),
                child: ElevatedButton(
                  child: Icon(Icons.shopping_cart, size: 25),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    primary: Colors.black38,
                    onPrimary: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return KeranjangProduk();
                        })
                    );
                  }),
                ) : ElevatedButton(
                  child: Icon(Icons.shopping_cart, size: 25),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    primary: Colors.black38,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return KeranjangProduk();
                        })
                    );
                  }),
            )
          ]
      ),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: size.height*0.5,
                alignment: Alignment.center,
                child: Image(
                  image: CachedNetworkImageProvider(
                      detail.imgProduk
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height* 0.4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: Row(
                        children: [
                          Text(detail.nama,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Rp'+detail.harga,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: blacksand,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:20),
                      child: Row(
                        children: <Widget>[
                          RatingBarIndicator(
                            rating: double.parse(detail.rating),
                            itemBuilder: (_, __) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            itemSize: 20,
                          ),
                          Text(' '+detail.rating,style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text(
                        detail.deskripsi,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Divider(
                      color: greyy,
                      height: 25,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                            child: Padding(
                                padding: EdgeInsets.only(top: 5, left: 30, bottom: 20),
                                child:Row(
                                  children:[
                                    CircleAvatar(
                                      backgroundImage: CachedNetworkImageProvider(
                                        detail.imgDesainer,
                                      ),
                                      radius: 40,
                                    ),
                                    SizedBox(width: 43,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                detail.namaDesainer,
                                                style:  TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 2,),
                                              Text(
                                                'Desainer '+detail.kategoriDesainer,
                                                style:  TextStyle(
                                                  fontSize: 13,
                                                  color: darkgrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            child: Text("Kunjungi",
                                              style:  TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                              onPressed: (){
                                              },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              onPrimary: blacksand,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: blacksand, width: 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        detail.ratingDesainer,
                                                        style:  TextStyle(
                                                          fontSize: 14,
                                                          color: blacksand,
                                                        ),
                                                      ),
                                                      Text(
                                                       "  Penilaian"
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        detail.projekDesainer,
                                                        style:  TextStyle(
                                                          fontSize: 14,
                                                          color: blacksand,
                                                        ),
                                                      ),
                                                      Text(
                                                        " Projek"
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),
                      ),
                    Divider(
                      color: greyy,
                      height: 0,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> upsertKeranjang(String Nama) async {
    bool status = false;
    CartShop? keranjang;
    for(int i = 0;i<listKeranjang.length;i++){
      if(listKeranjang[i].NamaProduk == Nama){
        status = true;
        keranjang = listKeranjang[i];
      }
    }

    if(status == true){
      await db.updateKeranjang(CartShop.fromMap({
        'Id' : keranjang!.id,
        'NamaProduk' : keranjang.NamaProduk,
        'Harga' : keranjang.Harga,
        'Jumlah' : keranjang.Jumlah+1,
        'Gambar' : keranjang.Gambar,
        'Status' : keranjang.Status,
      }));
    }else{
      await db.saveKeranjang(CartShop(
        NamaProduk: detail.nama,
        Harga: detail.harga,
        Gambar: detail.imgProduk,
        Jumlah: 1,
        Status: 0,
      ));
    }
    _getAllKeranjang();
  }
  List<CartShop> listKeranjang = [];
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