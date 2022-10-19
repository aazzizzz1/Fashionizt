import 'dart:convert';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/checkout.dart';
import 'package:fashionizt/pages/detail_project_user.dart';
import 'package:fashionizt/pages/payment.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fashionizt/Widget/bottom_navbar.dart';
import 'package:fashionizt/pages/home_pages.dart';
import '../Api/api_project.dart';
import '../Data/db_helper_user.dart';
import '../Models/User.dart';
import '../Models/project_model.dart';
import '../Widget/card_project_customer.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../variabels.dart';

class FormAlamat extends StatefulWidget {
  const FormAlamat({Key? key}) : super(key: key);

  @override
  _PreOrderState createState() => _PreOrderState();
}

class _PreOrderState extends State<FormAlamat> with SingleTickerProviderStateMixin{
  List<UserList> listUser = [];
  DbHelperUser dbu = DbHelperUser();
  // UserElement? akun;
  var dataUser;

  late AnimationController loadingController;
  late Future<Project> _project;

  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController telepon = new TextEditingController();

  Future submit() async {
    final uri = Uri.parse("https://fashionizt.yufagency.com/order.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['Nama Penerima'] = nama.text;
    request.fields['Alamat lengkap'] = alamat.text;
    request.fields['Nomor Telepon'] = telepon.text;

    await request.send().then((result) {
      http.Response.fromStream(result).then((response) {
        var message = jsonDecode(response.body);
        if (message == "Error") {
          Fluttertoast.showToast(
            msg: "Data Input Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            fontSize: 15,
            textColor: blush,
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return FormAlamat();
              })
          );
        } else if (message == "Blank")  {
          Fluttertoast.showToast(
            msg: "Please Fill Out The Entire Form",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            fontSize: 15,
            textColor: blush,
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return FormAlamat();
              })
          );
        } else {
          Fluttertoast.showToast(
            msg: "Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            fontSize: 15,
            textColor: blush,
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return FormAlamat();
              })
          );
        }
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });

    _project = ApiServiceProject().topHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: blacksand,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: blush,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                title: const Text('Leave This Page'),
                content: const Text('Are you sure?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('Cancel',
                      style: TextStyle(
                        color: blacksand,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Checkout()
                      ),
                  ),
                  child: Text('OK',
                    style: TextStyle(
                      color: blacksand,
                      fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                    ],
                    ),
                    ),
                  ),
          title: Text(
            'Form Alamat',
            style: TitleApps,
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                  padding: EdgeInsets.all(22.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Nama Penerima :',
                            style: TextStyle(
                                fontSize: 16 ,
                                fontWeight: FontWeight.w600
                            ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: nama,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                            'Alamat Lengkap :',
                            style: TextStyle(
                                fontSize: 16 ,
                                fontWeight: FontWeight.w600,
                            ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: alamat,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                            'Nomor Telepon :',
                            style: TextStyle(
                                fontSize: 16 ,
                                fontWeight: FontWeight.w600,
                            ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: telepon,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                          color: blacksand,
                          elevation: 5,
                          child: Container(
                            height: 40,
                            child: InkWell(
                              splashColor: blush,
                              onTap: (){
                                submit();
                              },
                              child: Center(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: blush,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 5),
                  child: FutureBuilder(
                    future: _project,
                    builder: (context, AsyncSnapshot<Project> snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.project.length,
                            itemBuilder: (context, index) {
                              var project = snapshot.data?.project[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return DetailProjectUser(project :project!);
                                        }
                                        ),
                                    );
                                  },
                                  child: CardProject(project: project!)
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        } else {
                          return Text('');
                        }
                      }
                    },
                  ),
                ),
              ),
            ]
  )
    )
  );
  // Future<void> _getUser() async{
  //   var list = await dbu.getUser();
  //   listUser.clear();
  //   setState(() {
  //     list!.forEach((user) {
  //       listUser.add(UserList.fromMap(user));
  //     });
  //   });
  // }
}