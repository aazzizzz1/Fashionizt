import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(String username) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("username", username);
    // _preferences.setString("password", password);
    // _preferences.setString("email", email.text);
  }

  Future readCache(String username) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString("username");
    return cache;
  }

  static Future removeCache(String username) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("username");
    // _preferences.remove("password");
    // _preferences.remove("email");
  }
}