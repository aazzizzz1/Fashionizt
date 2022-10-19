import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:fashionizt/Models/User.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/edit_myprofile.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashionizt/Widget/alert_dialog.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../shared_preferences.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{
  final PrefService _prefService = PrefService();
  late String username = '';
  String title = 'AlertDialog';
  bool tappedYes = false;
  List<UserList> listUser = [];
  int i = 0;
  DbHelperUser db = DbHelperUser();

  @override
  void initState() {
    _getUser();
    super.initState();
    initial();
  }
  void initial() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      username = _preferences.getString("username")!;
    });
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: blacksand,
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: TitleApps,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final action = await AlertDialogs.yesCancelDialog(context,'Logout','are you sure ?');
              if(action == DialogsAction.yes) {
                setState(() {
                  tappedYes = true;
                });
              } else {
                setState(() => tappedYes = false);
              }
            },
            icon: const Icon(Icons.logout_rounded, size: 25,),
            color: blush,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size.height*0.35,
              width: size.width*0.5,
              child: CircleAvatar(
                    backgroundImage: AssetImage('lib/Assets/images/profil.jpg'),
                    // backgroundImage: CachedNetworkImageProvider(
                    //     konveksi.imgProfil),
                    radius: 90,
                  )
            ),
            Container(
              height: size.height * 0.001,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      listUser.length == 1 ?  listUser[i].Username : 'Customer'+listUser.length.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1, bottom: 1, right: 7, left: 7),
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: blacksand),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // height: size.height * 0.1,
                    child: Text(
                      listUser.length == 1 ? listUser[i].Level : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: blacksand,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    // height: size.height * 0.1,
                    child: Text(
                      listUser.length == 1 ? listUser[i].Email : 'customer@fashionizt.com',
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
              height: size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              width: width / 1.2,
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
                      fontWeight:
                      FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return EditMyProfile();
                    }));},
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
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