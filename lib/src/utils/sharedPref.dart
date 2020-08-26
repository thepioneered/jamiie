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

  static Future<Null> setTokenMobileFirstLogin(String _token, String _mobile,
      bool _profileCompleted, bool _riskCalculated) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      prefs.setBool('profileCompleted', _profileCompleted);
      prefs.setBool('riskCalculated', _riskCalculated);
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

  // static Future<Null> setFirstLogin() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('firstlogin', true);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // static Future<bool> getFirstLogin() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     bool status = prefs.getBool('firstlogin');
  //     return status;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
  static Future<bool> isProfileComplete() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool status = prefs.getBool('profileCompleted');
      return status;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> isRiskCalculated() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool status = prefs.getBool('riskCalculated');
      return status;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Null> setisProfileComplete() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('profileCompleted', true);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Null> setisRiskCalculated() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setBool('riskCalculated', true);
    } catch (e) {
      throw Exception(e);
    }
  }
}
