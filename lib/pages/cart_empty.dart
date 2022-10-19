import '../theme.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: blacksand,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: blush,
            onPressed: () {Navigator.pop(context);},
          ),
          title: Text(
            'Keranjang',
            style: TitleApps,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('lib/Assets/images/empty_cart.png'),
            ),
          ),
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: blacksand,
              fontSize: 26,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Sepertinya anda belum menambahkan produk ke keranjang anda',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}