import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<Null> setToken(String _token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token);
  }

  Future<Null> setTokenMobile(String _token, String _mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token);
    prefs.setString('mobile', _mobile);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }

  Future<Null> setMobile(String _mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mobile', _mobile);
  }

  Future<String> getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String mobile = prefs.getString('mobile');

    return mobile;
  }

  Future<Null> deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
