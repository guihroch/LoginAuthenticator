import 'package:autenticar_login_sozinho/Controllers/Login_Controller.dart';
import 'package:autenticar_login_sozinho/Pages/Home_page.dart';
import 'package:autenticar_login_sozinho/Repository/Login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController(LoginRepository());
  final LoginRepository _loginRepository = LoginRepository();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('images/nubank.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _loginRepository.emailController,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Digite um e-mail válido';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Text('E-mail'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _loginRepository.passwordController,
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Digite uma senha válida';
                  }
                  if (senha.length < 6) {
                    return 'Digite uma senha maior que 6 caracteres';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text('Senha'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    bool autorizado = await _loginRepository.login();
                    if (autorizado) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Login ou senha inválidos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      letterSpacing: 2, fontSize: 15, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
