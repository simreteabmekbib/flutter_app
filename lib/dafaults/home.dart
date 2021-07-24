import 'package:flutter/material.dart';
import 'cart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF98eb34),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
