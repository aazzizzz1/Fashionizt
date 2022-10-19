import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/gridview_feeds.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:from_css_color/from_css_color.dart';

class DetailFeeds extends StatelessWidget {
  const DetailFeeds({Key? key,required this.feeds}) : super(key: key);
  final DesainerElement feeds;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text('Profil Desainer',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            new Padding(padding: new EdgeInsets.all(20.0)),
            CircleAvatar(
              backgroundImage:  CachedNetworkImageProvider(
                  feeds.imgProfil),
              radius: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35.0),
              child: Text(
                feeds.nama,
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
                feeds.bio,
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
                          feeds.rating + '/5 ',
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
                        feeds.jmlhProject + ' ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Icon(Icons.task_outlined, color: Colors.black),
                    ], // <Widget>[]
                  ),
                  Row(
                    children: <Widget> [
                      Container(padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      SizedBox.fromSize(
                        size: Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: fromCssColor('#FAF3E0'),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: InkWell(
                              // splashColor: Colors.grey,
                              onTap: () => _launchURL(feeds.linkWa),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                      Icons.chat_bubble_outline,
                                      size: 35.0), // <-- Icon
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ], // <Widget>[]
                  ),
                ],
              ), // Row
            ),
            Container(
              child: GridViewFeeds(),
            )//Container Icon
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text('Profil Konveksi',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            new Padding(padding: new EdgeInsets.all(20.0)),
            CircleAvatar(
              backgroundImage:  CachedNetworkImageProvider(
                  konveksi.imgProfil),
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
                      const Icon(Icons.task_outlined, color: Colors.black),
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
                                    size: 35.0), // <-- Icon
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
              margin: const EdgeInsets.only(top: 20.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget> [
                      Text(
                        'Pengalaman',
                        style: const TextStyle(
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
              margin: const EdgeInsets.only(top: 10.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget> [
                      for (int i = 0; i < 8; i++)
                        Text(
                          'Produksi PDH Pegawai Shopee 2022', //ini belum bener ya
                          style: const TextStyle(
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

