import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/project_model.dart';
import '../constants.dart';
import '../pages/detail_project_user.dart';

class CardProject extends StatelessWidget {
  final ProjectElement project;
  const CardProject({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            project.judul,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600
                            )
                        ),
                        SizedBox(height: 10),
                        Text(
                            "Biaya : " +project.biaya,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: blacksand
                            )
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                        project.createdAt,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey
                        )
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DetailProjectUser(project: project);
                            })
                        );
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: blacksand,
                      ),
                      child: Text(
                          "Detail",
                          style: TextStyle(
                              color: blush
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

