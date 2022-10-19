import 'package:fashionizt/constants.dart';
import 'package:flutter/material.dart';

class SubTittle extends StatelessWidget {
  SubTittle({required this.sub});
  String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 8),
      child: Text(
        sub,
        style: TextStyle(
            color: blacksand,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}