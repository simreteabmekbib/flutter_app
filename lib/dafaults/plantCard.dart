import 'package:blue_moon_flatter/dafaults/buy_confirm.dart';
import 'package:blue_moon_flatter/dafaults/detail.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:blue_moon_flatter/dafaults/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, imgPath) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child:  Card(
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Ink.image(image: 
                AssetImage(imgPath),
                height: 100,
                width: 152,
                fit: BoxFit.fitWidth,),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('plant name'),
                  Text('plant description'),
                ],
              ),
            ),
            ButtonBar(children: <Widget>[
              TextButton(
                child: Text('Detail', 
                  style: TextStyle(color: Color(0xff4AA96C), fontWeight: FontWeight.w400)),
                onPressed: () {
                  // To do
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail()),
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
                    MaterialPageRoute(builder: (context) => BuyConfirm()),
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
          ],),),
    ),
  );
}
