import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class CardMitraProfile extends StatelessWidget {
  final KonveksiElement konveksi;
  const CardMitraProfile({required this.konveksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        margin: EdgeInsets.all(5),
        width: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(konveksi.imgProfil),
                  radius: 65,
                ),
              ),
            ),
            SizedBox(height: 0),
            Text(
              konveksi.nama,
              style: NameHorizontalCardTextStyle,
            ),
            SizedBox(height: 5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.amber,
                  ),
                  Text(
                    konveksi.rating,
                    style: RatingHorizontalCardTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              konveksi.bio,
              style: BioHorizontalCardTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

