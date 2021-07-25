import 'package:flutter/material.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:blue_moon_flatter/dafaults/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import './dafaults/defaults.dart';
import './dafaults/home.dart';
import 'dafaults/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    Post(),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    ),
    Login(),
    SignUp(),
    Center(
      child: Text('logout'),
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
          'Find Green',
        ),
        backgroundColor: Color(0xFF4AA96C),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
            color: Colors.grey[100],),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.grey[100],
          ),
          SizedBox(width: 10),
        ],
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
                color: Color(0xFF4AA96C),
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
                      'simri Mek',
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
                      'sim@gmail.com',
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
                  AppDrawerTile(
                    index: 6,
                    onTap: updateState(6),
                  ),
                  AppDrawerTile(
                    index: 7,
                    onTap: updateState(7),
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
        selectedTileColor: Colors.grey[300],
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 22,
          color: indexClicked == index
              ? Color(0xffF55C47)
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
            fontSize:15,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Color(0xff564A4A)
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}
