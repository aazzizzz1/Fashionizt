import 'package:fashionizt/Data/ProviderCart.dart';
import 'package:fashionizt/constants.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../Widget/bottom_navbar_fittingroom.dart';

class FittingRoom extends StatefulWidget {
  const FittingRoom({Key? key}) : super(key: key);

  @override
  State<FittingRoom> createState() => _FittingRoomState();
}

class _FittingRoomState extends State<FittingRoom> {
  int click = 0;
  String busanaAtasan = "";
  String busanaBawahan = "";

  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    busanaAtasan = "lib/Assets/images/jaket.png";
    busanaBawahan = "lib/Assets/images/celana.png";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fittingRoom = Provider.of<FittingRoomProv>(context,listen: true);
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
          title: Text(
            'Fashionizt',
            style: TitleApps,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: size.height*0.06,
            child: Row(
              children: [
                BottomNavbarFittingRoom(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height * 0.6,
                      width: size.width,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.25,
                            left: MediaQuery.of(context).size.width * 0.25,
                            child: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.58,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(busanaBawahan),
                                ),
                              ),
                            ),
                          ),//bawahan tampil
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.25,
                            child: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.58,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(busanaAtasan),
                                ),
                              ),
                            ),
                          ),//atasantampil
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.20,
                      left: MediaQuery.of(context).size.width * 0.04,
                      child: CircleAvatar(
                          radius: 35,
                          backgroundColor: click == 0? blacksand : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click = 0;
                                fittingRoom.setStatus(click);
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(busanaAtasan),
                              radius: 32,
                            ),
                          )
                      ),
                    ),//ikon pilihan atasan
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.31,
                      left: MediaQuery.of(context).size.width * 0.04,
                      child: CircleAvatar(
                          radius: 35,
                          backgroundColor: click == 1 ? blacksand : Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                click = 1;
                                fittingRoom.setStatus(click);
                              });
                              print("Click event on Container");
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(busanaBawahan),
                              radius: 32,
                            ),
                          )
                      ),
                    ),//ikon pilihan bawahan
                  ],
                ),
                Text(
                  'Create a Look',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: blacksand,
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/kaos.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaAtasan = 'lib/Assets/images/kaos.png';
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/jaket.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaAtasan = 'lib/Assets/images/jaket.png';
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/rok.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaBawahan = 'lib/Assets/images/rok.png';
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/batik.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaAtasan = 'lib/Assets/images/batik.png';
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/celanapendek.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaBawahan = 'lib/Assets/images/celanapendek.png';
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.001),
                                  height: size.height * 0.15,
                                  width: size.width * 1,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('lib/Assets/images/jeans.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            busanaBawahan = 'lib/Assets/images/jeans1.png';
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}