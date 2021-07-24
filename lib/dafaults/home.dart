import 'package:flutter/material.dart';
import 'cart.dart';
import 'signup.dart';
import 'plantCard.dart';
import 'login.dart';
import 'post.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, mainAxisSpacing: 20),
              itemBuilder: (context, index) => buildCard(context, 'assets/images/profile.jpg'),
            ),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         buildCard(context, 'assets/images/profile.jpg'),
      //         buildCard(context, 'assets/images/profile.jpg'),
      //       ],
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7BC74D),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Post()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
