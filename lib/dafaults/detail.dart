import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Image Detail'),
        backgroundColor: Color(0XFF7BC74D),
      ),
    );
  }
}