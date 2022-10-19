import 'package:fashionizt/Api/api_produk.dart';
import 'package:fashionizt/Data/db_helper.dart';
import 'package:fashionizt/Models/Cart.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/Pages/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Widget/product_card.dart';

class GridViewProduk extends StatefulWidget {
  const GridViewProduk({Key? key}) : super(key: key);

  @override
  State<GridViewProduk> createState() => _GridViewProdukState();
}

class _GridViewProdukState extends State<GridViewProduk> {
  late Future<Produk> _produk;

  @override
  void initState(){
    super.initState();
    _produk = ApiServiceProd().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    // var keranjang = Provider.of<KeranjangProv>(context, listen: true);

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
                      onTap: () async{
                        final value = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailProduct(detail: produk!);
                            })
                        );
                        setState(() {
                          _getAllKeranjang();
                        });
                      },
                      child: ProductCard(produk: produk!)
                  );
                },
                itemCount: snapshot.data?.produk.length,
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }else{
              return Text('');
            }
          }
        },
      ),
    );
  }

  List<CartShop> listKeranjang = [];
  DbHelper db = DbHelper();
  Future<void> _getAllKeranjang() async {
    var list = await db.getAllKeranjang();
    setState(() {
      listKeranjang.clear();
      list!.forEach((keranjang) {
        listKeranjang.add(CartShop.fromMap(keranjang));
      });
    });
  }
}