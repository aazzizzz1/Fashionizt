import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart';

class ApiServiceUs {
  String? Username;
  ApiServiceUs(String Username){
    this.Username = Username;
  }
  Future<User> topHeadlines() async {
    final response = await http.post(
        Uri.parse('https://fashionizt.yufagency.com/user.php'),body: {
        "username" : Username,
    });
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}