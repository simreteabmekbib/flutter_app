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
      appBar: AppBar(
        centerTitle: true,
        // toolbarHeight: 36,
        title: Text(
          'Home',
          style: TextStyle(
            // fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      //   child: Container(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: GridView.builder(
      //         itemCount: 10,
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, mainAxisSpacing: 20),
      //         itemBuilder: (context, index) => buildCard(context, 'assets/images/profile.jpg'),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard(context, 'assets/images/profile.jpg'),
                buildCard(context, 'assets/images/profile.jpg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard(context, 'assets/images/profile.jpg'),
                buildCard(context, 'assets/images/profile.jpg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCard(context, 'assets/images/profile.jpg'),
                buildCard(context, 'assets/images/profile.jpg'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7BC74D),
        onPressed: () {
          if(loggedIn){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Post()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          }
        },
        tooltip: 'Post',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
