import 'package:fashionizt/pages/detail_mitra.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_short_konveksi.dart';
import 'package:fashionizt/Models/konveksi_model.dart';
import 'package:fashionizt/Widget/card_mitra_profile.dart';

class HorizontalMitraListView extends StatefulWidget {
  const HorizontalMitraListView({Key? key}) : super(key: key);

  @override
  State<HorizontalMitraListView> createState() => _HorizontalMitraListViewState();
}

class _HorizontalMitraListViewState extends State<HorizontalMitraListView> {
  late Future<Konveksi> _konveksi;
  @override
  void initState(){
    super.initState();
    _konveksi = ApiServiceMit().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      padding: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: _konveksi,
        builder: (context, AsyncSnapshot<Konveksi> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var konveksi = snapshot.data?.konveksi[index];
                    return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return DetailMitra(konveksi: konveksi!);
                              })
                          );
                        },
                        child: CardMitraProfile(konveksi: konveksi!)
                    );
                  },
                  itemCount: snapshot.data?.konveksi.length,
                ),
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