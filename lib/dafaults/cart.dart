import 'dart:async';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  // const Cart({ Key? key }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  funPrint() => print('button clicked');
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Total Price =',
            ),
            backgroundColor: Color(0xFFFF9800),
          ),
          body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 5, left: 5),
          child: ElevatedButton(            
            child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text('NEXT', style: TextStyle(
        fontSize: 15,
      ),),),
            onPressed: funPrint,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFF9800),
               // This is what you need!
            ),
          ),
        ));
  }
}
