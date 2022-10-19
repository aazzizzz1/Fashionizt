import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fashionizt/constants.dart';
import '../Data/db_helper_user.dart';
import '../Models/User.dart';
import '../Models/project_list_all_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class DetailProjectDesainerMitra extends StatefulWidget {
  DetailProjectDesainerMitra({Key? key, required this.project}) : super(key: key);
  final ProjectElement project;

  @override
  _DetailProjectDesainerMitraState createState() => _DetailProjectDesainerMitraState(project: project);
}

class _DetailProjectDesainerMitraState extends State<DetailProjectDesainerMitra>{
  final ProjectElement project;
  _DetailProjectDesainerMitraState({Key? key, required this.project});

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  DbHelperUser db = DbHelperUser();
  List<UserList> listUser = [];
  int I = 0;
  int idDesainer = 1;

  @override
  void initState() {
    _getUser();
    super.initState();
    initial();
  }

  void initial() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      var username = _preferences.getString("username")!;
      print (username);
    });
  }

  Future request(String idProject, Object? idDesainer) async {
    final response = await http.post(Uri.parse("https://fashionizt.yufagency.com/accept_desainer.php"), body: {
      "id_project" : idProject,
      "id_desainer" : idDesainer,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Successfully Request",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Failed to Request",
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
            vertical:size.height * 0.01),
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
                    'Kebutuhan Spesifik : ',
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
                    'Biaya : ',
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
                    'Lampiran : ',
                    style: FieldDetailProject,
                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                    'Diajukan oleh : ',
                    style: FieldDetailProject,
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
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.username,
                            style: UsernameDetailProject,
                          )
                        ],
                      ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: size.height * 0.20,
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
                      textStyle: AcceptDetailProject,
                    ),
                    onPressed: () {
                      setState(() {
                        // idDesainer = listUser.length == 1 ? listUser[I].id : '';
                      });
                      //request(project.id, idDesainer);
                    },
                    child: Text('Request'),
                  ),
                )
              ], // <Widget>[]
            ),
          ],
        )
      ),
    );
  }

  Future<void> _getUser() async{
    var list = await db.getUser();
    listUser.clear();
    setState(() {
      list!.forEach((user) {
        listUser.add(UserList.fromMap(user));
      });
    });
  }
}