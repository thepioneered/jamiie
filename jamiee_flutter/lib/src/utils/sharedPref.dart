import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<Null> setToken(String _token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
}
