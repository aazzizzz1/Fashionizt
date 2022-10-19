import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/konveksi_model.dart';

class ApiServiceMit {
  Future<Konveksi> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://api.yufagency.com/konveksi'));
    if (response.statusCode == 200) {
      return Konveksi.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
