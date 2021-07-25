import 'package:blue_moon_flatter/dafaults/home.dart';
import 'package:flutter/material.dart';

class DeliveryOnTheWay extends StatelessWidget {
  const DeliveryOnTheWay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          '',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Confirmation successful!\n Your order is on the way.',
                style: TextStyle(
                  color: Colors.grey[800],
                  height: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'Please wait patiently while we deliver your package and prepare the necessary amount of money to make our service efficient and fast.',
                style: TextStyle(
                  height: 1.2,
                  fontSize: 16.5,
                ),
              ),
              SizedBox(height: 50,),
              Icon(Icons.motorcycle, size: 80, color: Color(0xff7BC74D),),
            ],
          ),
        ),
      ),
    );
  }
}