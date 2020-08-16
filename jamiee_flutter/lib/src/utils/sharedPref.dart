import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<Null> setToken(String _token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Null> setTokenMobile(String _token, String _mobile) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      prefs.setString('mobile', _mobile);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenValue = prefs.getString('token');
      return tokenValue;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Null> setMobile(String _mobile) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('mobile', _mobile);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> getMobile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobile = prefs.getString('mobile');
      return mobile;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Null> deleteData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    } catch (e) {
      throw Exception(e);
    }
  }
}
