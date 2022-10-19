import 'package:fashionizt/Api/api_produk.dart';
import 'package:fashionizt/Models/produk_model.dart';
import 'package:fashionizt/Pages/detail_product.dart';
import 'package:fashionizt/Widget/feeds_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewFeeds extends StatefulWidget {
  const GridViewFeeds({Key? key}) : super(key: key);

  @override
  State<GridViewFeeds> createState() => _GridViewFeedsState();
}

class _GridViewFeedsState extends State<GridViewFeeds> {
  late Future<Produk> _feeds;

  @override
  void initState(){
    super.initState();
    _feeds = ApiServiceProd().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      child: FutureBuilder(
        future: _feeds,
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
                  crossAxisCount: 3,
                  childAspectRatio: 1/1,
                ),
                itemBuilder: (context, index) {
                  var feeds = snapshot.data?.produk[index];
                  return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailProduct(detail: feeds!);
                            })
                        );
                      },
                      child: FeedsCard(produk: feeds!)
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
}