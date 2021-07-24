import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
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
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'username',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'phone number',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'confirm password',
              ),
            ),
            ElevatedButton(
                onPressed: () => print('register'), child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
