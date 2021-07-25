import 'package:flutter/material.dart';
import 'cart.dart';
import 'signup.dart';
import 'plantCard.dart';
import 'login.dart';
import 'post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Plant {
  String name;
  String location;
  String use;
  String approved;
  String imgPath;
  var price;

  Plant(this.name, this.location, this.use, this.approved, this.imgPath, this.price);

  Plant.fromJson(Map json)
      : name = json['name'],
        location = json['location'],
        use = json['use'],
        approved = json['approved'],
        imgPath = json['imagePath'],
        price = json['price'];

  Map toJson() {
    return {'name': name, 'location': location, 'use': use, 'approved': approved, 'imagePath': imgPath, 'price': price};
  }
}

class _HomeState extends State<Home> {
  List<Plant> plants = [];

  getPlants() async{
    final response = await http.get(Uri.parse("http://localhost:5000/api/v1/user/plants"));

    if (response.statusCode == 200){
      List<dynamic> values = [];
      values = json.decode(response.body);

      if (values.length > 0){
        for (int i = 0; i < values.length; i++){
          if (values[i] != null){
            Map<String, dynamic> map = values[i];
            plants.add(Plant.fromJson(map));
          }
        }
      }
      for (Plant plant in plants) {
        // print("Name: ${plant.name}  Approved: ${plant.approved}");
      }
      return plants;

    } else {
      throw Exception('Failed to load plants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // toolbarHeight: 36,
        title: Text(
          'Home',
          style: TextStyle(
            // fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: FutureBuilder(
        future: getPlants(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if (snapshot.data == null){
            return Container(
              child: Center(child: Text('Loading...'),),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, mainAxisSpacing: 10),
                  itemBuilder: (context, index) => buildCard(context, snapshot.data[index].name, snapshot.data[index].use, snapshot.data[index].imgPath, snapshot.data[index].price),
                ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7BC74D),
        onPressed: () {
          if(loggedIn){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Post()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
