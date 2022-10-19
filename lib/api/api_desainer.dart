import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/desainer_model.dart';


class ApiServiceDes {
  Future<Desainer> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://api.yufagency.com/desainer'));
    if (response.statusCode == 200) {
      return Desainer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}