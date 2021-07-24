import 'package:blue_moon_flatter/dafaults/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, my) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child:  Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Ink.image(image: 
                AssetImage(my),
                height: 100,
                fit: BoxFit.fitWidth,),
              ],
            ),
            Padding(padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'here plant',
                  style: TextStyle(color: Colors.black54),
                ),
                Text('plant name'),
                Text('plant description'),
              ],),
            ),
            ButtonBar(children: <Widget>[
            TextButton(
              child: Text('Detail'),
              onPressed: () {
                // To do
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Buy'),
              onPressed: () {
                // To do
              },
            ),
          ],),
          ],),),
    ),
  );
}
