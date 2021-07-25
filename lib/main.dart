import 'package:blue_moon_flatter/dafaults/update_approval_status.dart';
import 'package:flutter/material.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:blue_moon_flatter/dafaults/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import './dafaults/defaults.dart';
import './dafaults/home.dart';
import 'dafaults/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './dafaults/plantCard.dart';

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
var searchBody;
final searchController = TextEditingController();

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class Plant {
  String name;
  String location;
  String use;
  String approved;
  String imgPath;
  var price;

  Plant(this.name, this.location, this.use, this.approved, this.imgPath,
      this.price);

  Plant.fromJson(Map json)
      : name = json['name'],
        location = json['location'],
        use = json['use'],
        approved = json['approved'],
        imgPath = json['imagePath'],
        price = json['price'];

  Map toJson() {
    return {
      'name': name,
      'location': location,
      'use': use,
      'approved': approved,
      'imagePath': imgPath,
      'price': price
    };
  }
}

class _MainPageState extends State<MainPage> {
  final pages = [
    Home(),
    loggedIn ? Post() : SignUp(),
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
    UpdateApproval(),
  ];
  Function updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  Future<dynamic> getPlantData(search_term) async {
    http.Response response = await http.get(
        Uri.parse(
            'http://localhost:5000/api/v1/user/searchplants/$search_term'),
        headers: {'Accept': 'Application/json'});
    // print(response.body);
    return response.body;
  }

  List<Plant> plants = [];

  getSearch() {
    List<dynamic> values = [];
    values = json.decode(searchBody);

    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          plants.add(Plant.fromJson(map));
        }
      }
    }
    for (Plant plant in plants) {
      // print("Name: ${plant.name}  Approved: ${plant.approved}");
    }
    print(plants);
    return plants;
  }

  Icon search = Icon(
    Icons.search,
    color: Colors.grey[100],
  );
  Widget appTit = Text('Find Green');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTit,
        backgroundColor: Color(0xFF4AA96C),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (this.search.icon == Icons.search) {
                  this.search = Icon(Icons.cancel);
                  this.appTit = Container(
                    height: 50,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'search',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (text) {
                        searchBody = text!=''?getPlantData(text):null;
                      },
                    ),
                  );
                } else {
                  this.search = Icon(Icons.search);
                  this.appTit = Text('Find Green');
                }
              });
              print(searchController.text);
            },
            icon: search,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
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
                      loggedIn? currentUser['currentUserName']: "",
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
                      loggedIn? currentUser['currentUserEmail']: "",
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
                  AppDrawerTile(
                    index: 8,
                    onTap: updateState(8),
                  )
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
            fontSize: 15,
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
