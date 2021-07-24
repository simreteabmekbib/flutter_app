import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './dafaults/defaults.dart';
import './dafaults/home.dart';
import 'dafaults/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    Home(),
    Center(
      child: Text('Starred'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    ),
  ];

  Function updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Bar Example',
        ),
        backgroundColor: Color(0xFF62eb34),
      ),
      body: pages[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader( 
              // decoration: BoxDecoration(
                
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/drawer.jpg'),
              //   ),
              // ),
              padding: EdgeInsets.all(0),
              child: Container(
                color: Color(0xFFFF9800),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'John Rambo',
                      style: GoogleFonts.sanchez(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'john@rambo.com',
                      style: GoogleFonts.sanchez(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppDrawerTile(
                    index: 0,
                    onTap: updateState(0),
                  ),
                  AppDrawerTile(
                    index: 1,
                    onTap: updateState(1),
                  ),
                  AppDrawerTile(
                    index: 2,
                    onTap: updateState(2),
                  ),
                  AppDrawerTile(
                    index: 3,
                    onTap: updateState(3),
                  ),
                  AppDrawerTile(
                    index: 4,
                    onTap: updateState(4),
                  ),
                  AppDrawerTile(
                    index: 5,
                    onTap: updateState(5),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // const AppDrawerDivider(),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Center(
                  //   child: Text(
                  //     'JetMail',
                  //     style: GoogleFonts.sanchez(
                  //       fontWeight: FontWeight.w500,
                  //       fontStyle: FontStyle.italic,
                  //       fontSize: 20,
                  //       color: Defaults.drawerItemSelectedColor,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Center(
                  //   child: Text(
                  //     'Version 1.2.5',
                  //     style: GoogleFonts.sanchez(
                  //       fontWeight: FontWeight.w500,
                  //       fontStyle: FontStyle.italic,
                  //       fontSize: 12,
                  //       color: Defaults.drawerItemColor,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const AppDrawerDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Defaults.drawerItemColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    @required this.index,
    @required this.onTap,
  }) : super(key: key);

  final index;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}
