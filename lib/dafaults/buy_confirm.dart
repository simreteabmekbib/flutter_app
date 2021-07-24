import 'package:flutter/material.dart';

class BuyConfirm extends StatelessWidget {
  const BuyConfirm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          'Confirm Purchase',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Text(
                'You chose to buy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Plant Name',
                style: TextStyle(
                  color: Color(0xff303242),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Plant Price',
                style: TextStyle(
                  color: Color(0xff303242),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff393E46),
                  onPrimary: Color(0xff7BC74D),
                ),
                onPressed: () {
                  
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    'Confirm',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}