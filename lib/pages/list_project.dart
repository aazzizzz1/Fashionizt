import 'package:fashionizt/constants.dart';
import 'package:fashionizt/pages/detail_project_desainer_mitra.dart';
import 'package:fashionizt/theme.dart';
import 'package:flutter/material.dart';
import '../Models/project_list_all_model.dart';
import '../Widget/card_project_mitra.dart';
import '../api/api_project_list.dart';
import '../constants.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList>{
  late Future<Project> _project;

  @override
  void initState() {
    _project = ApiServiceProjectList().topHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: blacksand,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: blush,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'List Project',
          style: TitleApps,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 5),
          child: FutureBuilder(
            future: _project,
            builder: (context, AsyncSnapshot<Project> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.project.length,
                    itemBuilder: (context, index) {
                      var project = snapshot.data?.project[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailProjectDesainerMitra(project: project!);
                                }));
                          },
                          child: CardProjectMitra(project: project!)
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text('');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}