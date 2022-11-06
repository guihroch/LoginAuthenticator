import 'package:autenticar_login_sozinho/Controllers/Login_Controller.dart';
import 'package:autenticar_login_sozinho/Pages/Home_page.dart';
import 'package:autenticar_login_sozinho/Pages/Login_page.dart';
import 'package:autenticar_login_sozinho/Repository/Login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  LoginController _loginController = LoginController(LoginRepository());
  @override
  void initState() {
    super.initState();
    _loginController.autenticador().then(
      (value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
