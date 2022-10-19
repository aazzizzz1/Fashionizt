import 'package:fashionizt/Widget/item_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Data/data_kategori.dart';
import 'package:flutter/widgets.dart';
import 'package:fashionizt/size_config.dart';
import '../pages/kategori_pages.dart';


class CategoryProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for(int i=0;i<kategoriList.length;i++)
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return KategoriPage(namaKategori: kategoriList[i].name);
                      })
                  );
                },
                child: ItemCategory(nama: kategoriList[i].name, img: kategoriList[i].img)
              )
        ],
      ),
    );
  }
}