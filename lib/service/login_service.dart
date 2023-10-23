import '../helpers/user_info.dart';

class LoginService {
  static Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin' && password == 'admin') {
      await Future.wait([
        UserInfo.setToken("admin"),
        UserInfo.setUserID("1"),
        UserInfo.setUsername("admin"),
      ]);
      isLogin = true;
    }
    return isLogin;
  }
}
