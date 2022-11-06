import 'package:shared_preferences/shared_preferences.dart';

import 'package:autenticar_login_sozinho/Repository/Login_repository.dart';

class LoginController {
  LoginRepository _loginRepository;
  LoginController(
    this._loginRepository,
  );
  Future<bool> autenticador() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
