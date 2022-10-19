import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Connectivity extends StatelessWidget {

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height*0.2),
                height: size.height * 0.5,
                width: size.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('lib/Assets/images/ICE.jpg'),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Your Internet is Disconnected',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 1,
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Please check your Wi-fi or Mobile Data keep it on and disable airplane mode',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 1,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 96.7),
          ],
    );
  }
}