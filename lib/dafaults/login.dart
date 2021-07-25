import 'package:flutter/material.dart';
import 'package:blue_moon_flatter/dafaults/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final url = 'http://localhost:5000/api/v1';
  // final url = 'http://192.168.1.248:5000/api/v1';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        backgroundColor: Color(0xFF7BC74D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Posts post = Posts(
                      email: emailController.text,
                      password: passwordController.text);
                  createPost(url, body: post.toMap());
                  
                },
                child: Text('login')),
          ],
        ),
      ),
    );
  }
}

Future createPost(String url, {required Map body}) async {
  return http
      .post(Uri.parse(url + "/user/login"),
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(body))
      .then((http.Response response) {
    // print(body['email'].runtimeType);
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    } 
    print("Message returned: " + json.decode(response.body)['message']);
    return Posts.fromJson(json.decode(response.body));
  });
}

class Posts {
  final String email;
  final String password;

  Posts({required this.email, required this.password});

  factory Posts.fromJson(Map json) {
    return Posts(email: json['email'] ?? "", password: json['password'] ?? "");
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}
