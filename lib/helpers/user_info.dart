import 'package:shared_preferences/shared_preferences.dart';


const String TOKEN = "token";
const String USER_ID = "userID";
const String USERNAME = "username";

class UserInfo {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> _getPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<void> setToken(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(TOKEN, value);
  }

  static Future<String?> getToken() async {
    final SharedPreferences pref = await _getPreferences();
    return pref.getString(TOKEN);
  }

  static Future<void> setUserID(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(USER_ID, value);
  }

  static Future<String?> getUserID() async {
    final SharedPreferences pref = await _getPreferences();
    return pref.getString(USER_ID);
  }

  static Future<void> setUsername(String value) async {
    final SharedPreferences pref = await _getPreferences();
    await pref.setString(USERNAME, value);
  }

  static Future<String?> getUsername() async {
    final SharedPreferences pref = await _getPreferences();
    return pref.getString(USERNAME);
  }

  static Future<void> logout() async {
    final SharedPreferences pref = await _getPreferences();
    await pref.clear();
  }
}
