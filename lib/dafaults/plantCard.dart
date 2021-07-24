import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(my) {
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
                height: 200,
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
            ButtonBar(),
          ],),),
    ),
  );
}
