import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final dio = Dio();
  final url = 'https://matheus1940.c41.integrator.host/api/login';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dio.options.headers['content-type'] = 'application/json';
      var response = await dio.post(url, data: {
        "username": emailController.text,
        "password": passwordController.text,
      });
      if (response.statusCode == 200) {
        await prefs.setString('token', response.data['token']);
        return true;
      } else {
        print('Que pena, email ou senha inválidos');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}   







// Future<bool> login() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//       dio.options.headers['content-Type'] = 'application/json';
//       var response = await dio.post(
//         'https://matheus1940.c41.integrator.host/api/login',
//         data: {
//           "username": emailController.text,
//           "password": passController.text,
//         },
//       );
//       if (response.statusCode == 200) {
//         await prefs.setString('token', response.data['token']);
//         return true;
//       } else {
//         print('Que pena, email ou senha inválidos');
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }