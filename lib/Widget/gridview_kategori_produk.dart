import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/Pages/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/product_card.dart';
import '../api/api_kategori.dart';

class GridViewKategoriProduk extends StatefulWidget {
  GridViewKategoriProduk({
    Key? key,
    required this.nama_kategori,
  }): super(key: key);

  String nama_kategori;

  @override
  State<GridViewKategoriProduk> createState() => _GridViewKategoriProdukState( nama_kategori: nama_kategori);
}

class _GridViewKategoriProdukState extends State<GridViewKategoriProduk> {
  late Future<Produk> _produk;

  _GridViewKategoriProdukState({
    required this.nama_kategori,
  });
  String nama_kategori;

  @override
  void initState(){
    super.initState();
    _produk = ApiServiceKat(nama_kategori: nama_kategori).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, left: 8),
      child: FutureBuilder(
        future: _produk,
        builder: (context, AsyncSnapshot<Produk> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.53,
                ),
                itemBuilder: (context, index) {
                  var produk = snapshot.data?.produk[index];
                  return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailProduct(detail: produk!);
                            })
                        );
                      },
                      child: ProductCard(produk: produk!)
                  );
                },
                itemCount: snapshot.data?.produk.length,
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }else{
              return Text('Tidak ada data');
            }
          }
        },
      ),
    );
  }
}