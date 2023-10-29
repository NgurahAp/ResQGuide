import 'package:shared_preferences/shared_preferences.dart';

// Constants for sSharedPref
const String TOKEN = "token";
const String USER_ID = "userID";
const String USERNAME = "username";

class UserInfo {
  static SharedPreferences? _preferences;

  //Get the instance of shared
  static Future<SharedPreferences> _getPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  // Set the token
  static Future<void> setToken(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(TOKEN, value);
  }

  static Future<void> setUserID(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(USER_ID, value);
  }

  static Future<void> setUsername(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(USERNAME, value);
  }

  static Future<void> logout() async {
    final SharedPreferences pref = await _getPreferences();
    await pref.clear();
  }
}
