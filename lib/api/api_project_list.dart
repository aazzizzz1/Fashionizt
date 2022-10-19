import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/project_list_all_model.dart';

class ApiServiceProjectList {
  Future<Project> topHeadlines() async {
    final response = await http.post(
        Uri.parse('https://fashionizt.yufagency.com/projectlist.php'));
    if (response.statusCode == 200) {
      return Project.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}