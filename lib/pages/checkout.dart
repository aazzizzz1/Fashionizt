import 'package:fashionizt/pages/form_alamat.dart';
import 'package:fashionizt/pages/payment.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import '../constants.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blacksand,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          'Checkout',
          style: TitleApps,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
        ],
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width*0.05,
            vertical:size.height*0.01,
          ),
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            Text(
              'Alamat pengiriman ',
              //konveksi.nama,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Colors.black,
                //color: blacksand,
              ),
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Text(
                    'Tambahkan Alamat Baru',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              icon: Icon (Icons.arrow_forward_ios),
                              color: blacksand,
                              iconSize: 13.0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormAlamat()
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              //child: SubTittle(sub: "Kategori")
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                          color: blacksand,
                          width: 40,
                          height: 15,
                          child: Text(
                            "Penjual",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),

                        SizedBox(width: 10, height: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Erigostore ',
                                //konveksi.nama,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  //color: blacksand,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'lib/Assets/images/jaket.png',
                              width: 70,
                            )
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama product ',
                                //konveksi.nama,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  //color: blacksand,
                                ),
                              ),
                              Text(
                                'Size L, XL',
                                //konveksi.nama,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  //color: blacksand,
                                ),
                              ),
                              Text(
                                'Rp xxx,-',
                                //konveksi.nama,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  //color: blacksand,
                                ),
                              ),
                              Text(
                                'Jumlah : 2',
                                //konveksi.nama,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  //color: blacksand,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: blacksand,
                  ),
                  // Expanded(
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Text(
                      'Catatan :',
                      style: TextStyle(
                          fontSize: 13 ,
                          fontWeight: FontWeight.w600,
                      )
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: blacksand,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Text(
                          'Total Pesanan : (2 Produk)',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            // color: blacksand,
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Rp. xxxx,-',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    // color: Colors.black,
                                    color: blacksand,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    //child: SubTittle(sub: "Kategori")
                  ),
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                          ),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Container(
                                  color: blacksand,
                                  width: 40,
                                  height: 15,
                                  child: Text(
                                    "Penjual",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Thanksinsomnia ',
                                        //konveksi.nama,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          //color: blacksand,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                          ),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(
                                      'lib/Assets/images/kaos.png',
                                      width: 70,
                                    ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama product ',
                                        //konveksi.nama,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          // fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          //color: blacksand,
                                        ),
                                      ),
                                      Text(
                                        'Size L, XL',
                                        //konveksi.nama,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          // fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          //color: blacksand,
                                        ),
                                      ),
                                      Text(
                                        'Rp xxx,-',
                                        //konveksi.nama,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          // fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          //color: blacksand,
                                        ),
                                      ),
                                      Text(
                                        'Jumlah : 2',
                                        //konveksi.nama,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          // fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          //color: blacksand,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: blacksand,
                          ),
                          // Expanded(
                          // ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            //child: SubTittle(sub: "Kategori")
                          ),
                          Text('Catatan :',
                              style: TextStyle(
                              fontSize: 13 ,
                              fontWeight: FontWeight.w600,
                              )
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Text(
                                  'Total Pesanan : (2 Produk)',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    // color: blacksand,
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'Rp. xxxx,-',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            // color: Colors.black,
                                            color: blacksand,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            //child: SubTittle(sub: "Kategori")
                          ),
                          Divider(),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Text(
                                  'Total Pembayaran',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    // color: blacksand,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          'Rp. xxxx,-',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            // color: Colors.black,
                                            color: blacksand,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                width: 300,
                                height: 37,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: const EdgeInsets.all(5.0),
                                    primary: blush,
                                    backgroundColor: blacksand,
                                    shadowColor: Colors.black,
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentBayar()
                                      ),
                                    );
                                  },
                                  child: Text('Bayar Sekarang'),
                                ),
                              )
                            ], //Widget>[]
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}