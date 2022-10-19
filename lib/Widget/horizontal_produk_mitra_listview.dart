import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/pages/detail_mitra.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class HorizontalProdukMitraListView extends StatefulWidget {
  String idProject;
  HorizontalProdukMitraListView({required this.idProject});

  @override
  State<HorizontalProdukMitraListView> createState() => _HorizontalProdukMitraListViewState(idProject: idProject);
}

class _HorizontalProdukMitraListViewState extends State<HorizontalProdukMitraListView> {
  late Future<Konveksi> _konveksi;
  String status = "false";
  String idProject;
  _HorizontalProdukMitraListViewState({required this.idProject});

  @override
  void initState(){
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  Future accepted(String idKonveksi, String idProject) async {
    final response = await http.post(Uri.parse("https://fashionizt.yufagency.com/accept_konveksi.php"), body: {
      "id_konveksi" : idKonveksi,
      "id_project" : idProject,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Successfully Accepted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Failed to Accept",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 275,
      child: FutureBuilder(
        future: _konveksi,
        builder: (context, AsyncSnapshot<Konveksi> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var konveksi = snapshot.data?.konveksi[index];
                    return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return DetailMitra(konveksi: konveksi!);
                              })
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: size.height * 1,
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: CircleAvatar(
                                      backgroundImage:  CachedNetworkImageProvider(
                                          konveksi!.imgProfil),
                                      radius: 65,
                                    ),
                                  ),
                                ),
                                Text(
                                  konveksi.nama,
                                  style: NameHorizontalCardTextStyle,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 20.0,
                                        color: Colors.amber,
                                      ),
                                      Text(konveksi.rating,style: RatingHorizontalCardTextStyle,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                status == "false" || status == konveksi.id ?
                                ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      status = konveksi.id;
                                      print ("id project : " +idProject);
                                      print ("id konveksi : " +status);
                                    });
                                    accepted(status, idProject);
                                  },
                                  child: Text(
                                    'Accepted',
                                    style: TextStyle(
                                      color: status == konveksi.id ? Colors.white : Colors.green,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(status == konveksi.id ? Colors.green : Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.green),
                                        ),
                                      )
                                  ),
                                ) : ElevatedButton(
                                  onPressed: null,
                                  child: Text(
                                    'Rejected',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    );
                  },
                  itemCount: snapshot.data?.konveksi.length,
                ),
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }else{
              return Text('');
            }
          }
        },
      ),
    );
  }
}