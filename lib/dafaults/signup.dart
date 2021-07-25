import 'package:blue_moon_flatter/dafaults/home.dart';
import 'package:flutter/material.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final url = 'http://localhost:5000/api/v1';
  // final url = 'http://192.168.1.248:5000/api/v1';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  )
                  // hintText: 'Plant Name',
                ),
              ),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  )
                  // hintText: 'Plant Name',
                ),
              ),
              TextFormField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  )
                  // hintText: 'Plant Name',
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  )
                  // hintText: 'Plant Name',
                ),
              ),
              TextFormField(
                controller: confirmPassword,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  )
                  // hintText: 'Plant Name',
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff393E46),
                    onPrimary: Color(0xff7BC74D)
                  ),
                  onPressed: () {
                    Posts post = Posts(
                      email: emailController.text,
                      password: passwordController.text,
                      username: username.text,
                      phoneNumber: phoneNumber.text,
                      confirmPassword: confirmPassword.text,
                    );
                    createPost(url, body: post.toMap())
                    .then((value) {
                      if (value != ""){
                        print('signed up');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } else {
                        print('not signed up');
                      }
                    });
                  },
                  child: Text('Register'),
              ),
              SizedBox(height: 30,),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Color(0xff393E46),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
                },
                child: Text('Already have an account? Login',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future createPost(String url, {required Map body}) async {
  return http
      .post(Uri.parse(url + "/user/register"),
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(body))
      .then((http.Response response) {
    // print(body['email'].runtimeType);
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    } else {
      Login();
    }
    print("Message returned: " + json.decode(response.body)['username']);

    return json.decode(response.body)['username'];
  });
}

class Posts {
  final String email;
  final String password;
  final String username;
  final String phoneNumber;
  final String confirmPassword;

  Posts(
      {required this.email,
      required this.password,
      required this.username,
      required this.phoneNumber,
      required this.confirmPassword});

  factory Posts.fromJson(Map json) {
    return Posts(
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        username: json['usename'] ?? "",
        phoneNumber: json['phoneNumber'] ?? "",
        confirmPassword: json['confirmPassword'] ?? "");
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["email"] = email;
    map["password"] = password;
    map["username"] = username;
    map["phoneNumber"] = phoneNumber;
    map["confirmPassword"] = confirmPassword;

    return map;
  }}