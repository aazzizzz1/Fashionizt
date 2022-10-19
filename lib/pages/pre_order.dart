import 'dart:convert';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/detail_project_user.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
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

class PreOrder extends StatefulWidget {
  const PreOrder({Key? key}) : super(key: key);

  @override
  _PreOrderState createState() => _PreOrderState();
}

class _PreOrderState extends State<PreOrder> with SingleTickerProviderStateMixin{
  List<UserList> listUser = [];
  DbHelperUser dbu = DbHelperUser();
  var dataUser;

  late AnimationController loadingController;
  late Future<Project> _project;

  File? _file;
  PlatformFile? _platformFile;

  TextEditingController judul = new TextEditingController();
  TextEditingController kebutuhan = new TextEditingController();
  TextEditingController biaya = new TextEditingController();

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    } else {
      print('no image selected');
    }
    loadingController.forward();
  }

  Future submit() async {
    final uri = Uri.parse("https://fashionizt.yufagency.com/order.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['judul'] = judul.text;
    request.fields['kebutuhan'] = kebutuhan.text;
    request.fields['biaya'] = biaya.text;
    request.fields['id_user'] = IDUserGlob ;
    var pic = await http.MultipartFile.fromPath('lampiran', _file!.path);
    request.files.add(pic);

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
                return PreOrder();
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
                return PreOrder();
              })
          );
        } else {
          Fluttertoast.showToast(
            msg: "Preorder Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.2),
            fontSize: 15,
            textColor: blush,
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return PreOrder();
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
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBottomNavBar(currentTab: 0,currentScreen: HomePages()),)),
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
            'Pre Order',
            style: TitleApps,
          ),
          bottom: TabBar(
            indicatorColor: blush,
            labelColor: blush,
            tabs:<Widget>[
              Tab(
                child: Text('Form', style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),
              Tab(
                child: Text('Riwayat', style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                  padding: EdgeInsets.all(22.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Judul :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        TextField(
                          controller: judul,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Kebutuhan Spesifikasi :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        TextField(
                          controller: kebutuhan,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Biaya :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        TextField(
                          controller: biaya,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Lampiran :', style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600)),
                        GestureDetector(
                          onTap: selectFile,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(6),
                                dashPattern: [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Iconsax.folder_open, color: Colors.blue, size: 40,),
                                      SizedBox(height: 15,),
                                      Text('Tambahkan File Desain Anda', style: TextStyle(fontSize: 15, color: Colors.grey.shade400),),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ),
                        _platformFile != null
                            ? Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Desain Anda',
                                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15, ),),
                                  SizedBox(height: 10,),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              offset: Offset(0, 1),
                                              blurRadius: 3,
                                              spreadRadius: 2,
                                            )
                                          ]
                                      ),
                                      child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: Image.file(_file!, width: 70,)
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(_platformFile!.name,
                                                        style: TextStyle(fontSize: 13, color: Colors.black),),
                                                      SizedBox(height: 5,),
                                                      Text('${(_platformFile!.size / 1024).ceil()} KB',
                                                        style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Container(
                                                        height: 5,
                                                        clipBehavior: Clip.hardEdge,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(6),
                                                          color: Colors.blue.shade50,
                                                        ),
                                                        child: LinearProgressIndicator(
                                                          value: loadingController.value,
                                                        ),
                                                      ),
                                                    ]
                                                )
                                            )
                                          ]
                                      )
                                  )
                                ]
                            )
                        ):
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
                                child: Text("Submit", style: TextStyle(fontSize: 16, color: blush, fontWeight: FontWeight.bold),),
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
                                      }));
                                },
                                child: CardProject(project: project!)
                            );
                            },
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('lib/Assets/images/empty_preorder.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Pre-Order Is Empty',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: blacksand,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Sepertinya anda belum melakukan Pre Order sama sekali',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
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
            ])
    ),
  );
  Future<void> _getUser() async{
    var list = await dbu.getUser();
    listUser.clear();
    setState(() {
      list!.forEach((user) {
        listUser.add(UserList.fromMap(user));
      });
    });
  }
}