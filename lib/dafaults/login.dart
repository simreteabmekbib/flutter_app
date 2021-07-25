import 'package:blue_moon_flatter/dafaults/home.dart';
import 'package:blue_moon_flatter/dafaults/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';

var loggedIn = false;
var currentUser;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}


final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginState extends State<Login> {
  final url = 'http://localhost:5000/api/v1';
  // final url = 'http://192.168.1.248:5000/api/v1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            FutureBuilder(
              future: FlutterSession().get('email'),
              builder: (context,snapshot){
              return Text(snapshot.hasData ?snapshot.data.toString():'Loading');
            }),
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
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
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
                  Posts post = Posts(email: emailController.text, password: passwordController.text);
                  createPost(url, body: post.toMap())
                    .then((value) {
                      if (value['message'] == 'login'){
                        print('logged in');
                        loggedIn = true;
                        currentUser = value;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        print('not logged in');
                      }
                    });             
                }, 
                child: Text('login')),
          ],
        ),
      ),
    );

  }
}

Future createPost(String url, {required Map body}) async {
  return http.post(
      Uri.parse(url + "/user/login"), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body)
    ).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    // print("Message returned: " + json.decode(response.body)['message']);
    // return Posts.fromJson(json.decode(response.body));
    if (json.decode(response.body)['message'] == 'login'){
        FlutterSession().set('email', emailController.text);
    } 
    
    return json.decode(response.body);
  });
}
class Posts{
  final String email;
  final String password;
  
  Posts({required this.email, required this.password});

  factory Posts.fromJson(Map json) {
    return Posts(
      email: json['email'] ?? "",
      password: json['password'] ?? ""
    );
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}