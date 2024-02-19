import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future setUserId(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('userId', value);
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  Future logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
