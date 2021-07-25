import 'package:blue_moon_flatter/dafaults/buy_confirm.dart';
import 'package:blue_moon_flatter/dafaults/detail.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:blue_moon_flatter/dafaults/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, name, use, imgPath, price) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(3),
      child:  Card(
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(imgPath, width: 158, height: 100, fit: BoxFit.cover,),
                // Ink.image(image: 
                // NetworkImage(imgPath),
                // height: 100,
                // width: 158,
                // fit: BoxFit.fitWidth,),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name),
                  Text(use.length < 12? use: use.substring(0, 12) + "..."),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                TextButton(
                  child: Text('Detail', 
                    style: TextStyle(color: Color(0xff4AA96C), fontWeight: FontWeight.w400)),
                    onPressed: () {
                      // To do
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail(name: name, use: use, price: price, imgPath: imgPath,)),
                      );
                    },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff303242),
                  ),
                  child: Text('Buy', 
                  style: TextStyle(color: Color(0xff9FE6A0)),),
                  onPressed: () {
                    if(loggedIn){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BuyConfirm(name: name, price: price,)),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    }
                  },
                ),
          ],),
            ),
          ],),),
    ),
  );
}
