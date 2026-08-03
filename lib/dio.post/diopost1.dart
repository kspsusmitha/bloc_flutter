import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Dio dio = Dio();

  Future<void> login() async {
    Response response = await dio.post(
      "https://dummyjson.com/auth/login",
      data: {
        "username": "emilys",
        "password": "emilyspass",

      },
      // options: Options(
      //   headers: {
      //     'Authorization' :"dfvbhjnkmlkjhfdsdfghjkoiuytrefghjhn",
      //     'Content-type': 'application/json'
      //   }
      // )

    );

    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}