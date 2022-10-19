import 'package:fashionizt/Pages/detail_desainer.dart';
import 'package:fashionizt/Widget/card_desainer_profile.dart';
import 'package:flutter/material.dart';
import 'package:fashionizt/Api/api_short_desainer.dart';
import 'package:fashionizt/Models/desainer_model.dart';

class HorizontalDesainerListView extends StatefulWidget {
  const HorizontalDesainerListView({Key? key}) : super(key: key);

  @override
  State<HorizontalDesainerListView> createState() => _HorizontalDesainerListViewState();
}

class _HorizontalDesainerListViewState extends State<HorizontalDesainerListView> {
  late Future<Desainer> _desainer;

  @override
  void initState(){
    super.initState();
    _desainer = ApiServiceDes().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      padding: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: _desainer,
        builder: (context, AsyncSnapshot<Desainer> snapshot){
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
                    var desainer = snapshot.data?.desainer[index];
                    return InkWell(
                        onTap: (){
                          Navigator.push((context),
                              MaterialPageRoute(builder: (context){
                                return DetailDesainer(desainer: desainer!);
                              })
                          );
                        },
                        child: CardDesainerProfile(
                            desainer: desainer!
                        )
                    );
                  },
                  itemCount: snapshot.data?.desainer.length,
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