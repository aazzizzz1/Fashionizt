import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/project_model.dart';
import '../variabels.dart';

class ApiServiceProject {
  Future<Project> topHeadlines() async {
    final response = await http.post(
        Uri.parse('https://fashionizt.yufagency.com/project.php'),body: {
      "id_user" : IDUserGlob,
    });
    if (response.statusCode == 200) {
      return Project.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}