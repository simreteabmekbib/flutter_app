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
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Image(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.contain,
                  width: 180,
                  height: 180,
                ),
              ),  
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Price: 30 ETB'
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Buy',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
      )
    );
  }
}