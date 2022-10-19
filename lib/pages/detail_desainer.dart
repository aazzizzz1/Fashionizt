import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/gridview_feeds.dart';
import 'package:fashionizt/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:from_css_color/from_css_color.dart';

class DetailDesainer extends StatelessWidget {
  const DetailDesainer({Key? key,required this.desainer}) : super(key: key);
  final DesainerElement desainer;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: blush
          ),
        ),
        title: Text(
            'Profil Desainer',
            style: TextStyle(
              color: blush,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )
        ),
        backgroundColor: blacksand,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/Assets/images/cover.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.09,
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      radius: 88,
                      backgroundColor: Color(0xFFFFFFFF),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(desainer.imgProfil),
                        radius: 80,
                      ),
                    )
                ),
              ],
            ),
            Container(height: size.height * 0.12),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      desainer.nama,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      desainer.bio,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      const Icon(
                          Icons.star_border,
                          color: Colors.black
                      ),
                      Text(
                          desainer.rating + '/5 ',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          )
                      ),
                      Container(width: size.width*0.08),
                      Row(
                        children: <Widget> [
                          const Icon(
                              Icons.task_outlined,
                              color: Colors.black
                          ),
                          Text(
                            desainer.jmlhProject + ' ',
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ], // <Widget>[]
                      ),
                      Container(width: size.width*0.08),
                      Row(
                        children: <Widget> [
                          ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                    Icons.chat_outlined,
                                    size: 20.0
                                ), // <-- Icon
                                Text(
                                  ' Chat ',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(blacksand),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: blacksand)
                                ),
                              ),
                            ),
                            onPressed: () => _launchURL(desainer.linkWa),
                          ),
                        ], // <Widget>[]
                      ),
                    ], // <Widget>[]
                  ),
                  Container(height: size.height * 0.10),
                ],
              ),
            ),
            Container(child: GridViewFeeds()),
          ],
        ),
      ),
    );
  }
}

class ProfileKonveksi extends StatelessWidget {
  const ProfileKonveksi({Key? key,required this.konveksi}) : super(key: key);
  final KonveksiElement konveksi;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text(
            'Profil Konveksi',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(padding: EdgeInsets.all(20.0)),
            CircleAvatar(
              backgroundImage:  CachedNetworkImageProvider(konveksi.imgProfil),
              radius: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              child: Text(
                konveksi.nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                konveksi.bio,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      Text(
                          konveksi.rating + '/5 ',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          )
                      ),
                      const Icon(Icons.star_border, color: Colors.black),
                    ], // <Widget>[]
                  ),
                  SizedBox(width: 25),
                  Row(
                    children: <Widget> [
                      Text(
                        konveksi.jmlhProject + ' ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Icon(
                          Icons.task_outlined,
                          color: Colors.black
                      ),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),//Container Icon
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: fromCssColor('#FAF3E0'),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: InkWell(
                              splashColor: Colors.grey,
                              onTap: () => _launchURL(konveksi.linkWa),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                      Icons.whatsapp,
                                      size: 35.0
                                  ), // <-- Icon
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ], // <Widget>[]
                  ),
                  SizedBox(width: 25),
                  Row(
                    children: <Widget> [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.black,
                          backgroundColor: fromCssColor('#FAF3E0'),
                          elevation: 5,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () => _launchURL(konveksi.linkPorto),
                        child: Text('Portofolio'),
                      ),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 30.0
              ),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      const Text(
                        'Pengalaman',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 30.0
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget> [
                      for (int i = 0; i < 8; i++)
                        const Text(
                          'Produksi PDH Pegawai Shopee 2022', //ini belum bener ya
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          ),
                        ),
                    ],
                  ),
                ],
              ), // Row
            ),
          ],
        ),
      ),
    );
  }
}