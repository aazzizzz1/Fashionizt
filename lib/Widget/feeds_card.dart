import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard({required this.produk});
  final ProdukElement produk;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      elevation: 1,
      child: Column(
        children: [
          Image(
            fit: BoxFit.fill,
            width: size.width * 0.5,
            height: size.height * 0.147,
            image: CachedNetworkImageProvider(
              produk.imgProduk,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
              ],
            ),
          )
        ],
      ),
    );
  }
}
