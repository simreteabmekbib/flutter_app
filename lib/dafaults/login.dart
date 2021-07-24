import 'package:flutter/material.dart';
class Login extends StatelessWidget {

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
                hintText: 'password',
              ),
            ),
            
            ElevatedButton(
                onPressed: () => print('login'), child: Text('login')),
          ],
        ),
      ),
    );
    
  }
}