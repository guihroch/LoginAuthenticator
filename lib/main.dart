import 'package:autenticar_login_sozinho/Pages/Login_page.dart';
import 'package:autenticar_login_sozinho/Pages/Welcome_Page.dart';
import 'package:flutter/material.dart';

import 'Pages/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}


//Criar função login para chamarmos a api e através do login e senha corretos
// iremos poder salvar o usuario no sharedPreference.

//Criar a função autenticado no sharedpreference, onde iremos verificar se o token
// do usuario foi salvo.

//na welcomepage iremos verificar se  o token do usuario é valido, se sim, iremos
//encaminha-lo diretamente para a homepage, caso não seja, iremos envia-lo para a
//loginpage para ele digitar seus dados.

//precisamos criar um formulario através do form para salvar esse usuario.

//no botão de login, ao clicarmos, devemos encaminhar para a homepage caso o login esteja correto
// ou apresentar uma mensagem(snackbar) de login ou senha inválidos.