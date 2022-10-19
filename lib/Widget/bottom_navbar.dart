import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/home_pages.dart';
import 'package:fashionizt/pages/my_profile.dart';
import 'package:fashionizt/pages/pre_order.dart';
import 'package:flutter/material.dart';
import '../shared_preferences.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key,required this.currentTab,required this.currentScreen}) : super(key: key);
  int currentTab;
  Widget currentScreen;
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState(currentTab: currentTab,currentScreen: currentScreen);
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  _MyBottomNavBarState({required this.currentTab,required this.currentScreen});
  int currentTab;
  Widget currentScreen;
  final List<Widget> screens = [
    HomePages(),
    MyProfile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  final PrefService _prefService = PrefService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blacksand,
        child: Icon(Icons.assignment,color: blush),
        onPressed: (){
          Navigator.push((context),
              MaterialPageRoute(builder: (context){
                return PreOrder();
              })
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        currentScreen = HomePages();
                        currentTab = 0;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? blacksand : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0? blacksand : Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  'Pre Order',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: blacksand,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        _prefService.readCache("username").then((value) {
                          print('username : ' + value.toString());
                          if (value != null) {
                            currentScreen = MyProfile();
                            currentTab = 1;
                          }
                        });
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 1 ? blacksand : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 1? blacksand : Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
