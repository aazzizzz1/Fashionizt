import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Widget/horizontal_produk_desainer_listview.dart';
import 'package:fashionizt/Widget/horizontal_produk_mitra_listview.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import '../Models/project_model.dart';
import '../constants.dart';

class DetailProjectUser extends StatelessWidget {
  const DetailProjectUser({Key? key,required this.project}) : super(key: key);
  final ProjectElement project;

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
          'Detail Project',
          style: TitleApps,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: size.height * 1,
        width: size.width * 1,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical:size.height * 0.01,
          ),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Judul :',
                    style: FieldDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    project.judul,
                    style: KeteranganDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Kebutuhan Spesifik :',
                    style: FieldDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    project.kebutuhan,
                    style: KeteranganDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Biaya :',
                    style: FieldDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    project.biaya,
                    style: KeteranganDetailProject,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Lampiran :',
                    style: FieldDetailProject,
                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Desain Anda',
                              style: SubJudulGreyDetailProject,
                            ),
                            SizedBox(height: 10),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                      )
                                    ]
                                ),
                                child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image(
                                          image: CachedNetworkImageProvider(
                                            project.linkGambar,
                                          ),
                                          width: 70,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                              Text(project.lampiran,
                                                style: NamaLampiranDetailProject,
                                              ),
                                                SizedBox(height: 5),
                                                Text(project.size + ' KB',
                                                  style: SizeLampiranDetailProject,
                                                ),
                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                          ]
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Pelamar : ',
                    style: FieldDetailProject,
                  ),
                ],
              ),
            ),
            Text(
              'Desainer',
              style: SubJudulGreyDetailProject,
            ),
            HorizontalProdukDesainerListView(idProject: project.id),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
            Text(
              'Mitra Produksi',
              style: SubJudulGreyDetailProject,
            ),
            HorizontalProdukMitraListView(idProject: project.id),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}