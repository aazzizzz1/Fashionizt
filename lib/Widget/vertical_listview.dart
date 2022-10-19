import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/desainer_model.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/theme.dart';

class VerticalListDesainer extends StatelessWidget {
  const VerticalListDesainer({Key? key,required this.desainer}) : super(key: key);
  final DesainerElement desainer;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: whiteColor,
          elevation: 1,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.only(
                  top: 13,
                  left: 30,
                  bottom: 13
              ),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(desainer.imgProfil),
                    radius: 40,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              desainer.nama,
                              style: TitleVerticalCardTextStyle,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Desainer ' + desainer.kategori,
                              style: subtitleVerticalCardTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(desainer.rating + '/5'),
                                    Icon(
                                        Icons.star_border,
                                        color: Colors.black,
                                        size: 18
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(desainer.jmlhProject+ ' '),
                                    Icon(
                                        Icons.task_outlined,
                                        color: Colors.black,
                                        size: 18
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
        )
    );
  }
}

class VerticalListMitra extends StatelessWidget {
  const VerticalListMitra({Key? key,required this.konveksi}) : super(key: key);
  final KonveksiElement konveksi;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: whiteColor,
          elevation: 1,
          shadowColor: Colors.black,
          child: Padding(
              padding: EdgeInsets.only(
                  top: 13,
                  left: 30,
                  bottom: 13
              ),
              child:Row(
                children:[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(konveksi.imgProfil),
                    radius: 40,
                  ),
                  SizedBox(width: 40),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              konveksi.nama,
                              style: TitleVerticalCardTextStyle,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Mitra Produksi ' + konveksi.kategori,
                              style: subtitleVerticalCardTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
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
                                      konveksi.rating + '/5',
                                      style: TextStyle(color: Colors.black,),
                                    ),
                                    Icon(
                                        Icons.star_border,
                                        color: Colors.black,
                                        size: 18
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      konveksi.jmlhProject,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Icon(
                                        Icons.task_outlined,
                                        color: Colors.black,
                                        size: 18
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
        )
    );
  }
}