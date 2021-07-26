import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewPosts extends StatefulWidget {
  const ViewPosts({ Key? key }) : super(key: key);

  @override
  _ViewPostsState createState() => _ViewPostsState();
}

class Plant {
  String name;
  String location;
  String use;
  String approved;
  String imagePath;

  Plant(this.name, this.location, this.use, this.approved, this.imagePath);

  Plant.fromJson(Map json)
      : name = json['name'],
        location = json['location'],
        use = json['use'],
        approved = json['approved'],
        imagePath = json['imagePath'];

  Map toJson() {
    return {'name': name, 'location': location, 'use': use, 'approved': approved, 'imagePath': imagePath};
  }
}

class _ViewPostsState extends State<ViewPosts> {

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
    // print(plants);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: FutureBuilder(
        future: getPlants(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(plants);
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text('Loading...'),),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9, mainAxisSpacing: 10),
              itemBuilder: (context, index) => postCard(snapshot.data[index].name, snapshot.data[index].location, snapshot.data[index].use, snapshot.data[index].approved, snapshot.data[index].imagePath),
            );
          }
        },
      ),
      // child: Column(
      //   children: [
      //     postCard(Icons.done),
      //     postCard(Icons.close),
      //     postCard(Icons.help)
      //   ],
      // ),
    );
  }
}

Widget postCard(name, location, String use, approved, imagePath){
  return Card(
    margin: EdgeInsets.all(10),
    shadowColor: Colors.grey[300],
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    ),
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.65),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$name',
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),),
              SizedBox(height: 4,),
              Text('$location',
                style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),),
              SizedBox(height: 4,),
              Icon(
                approved == 'false'? Icons.close: approved == 'true'? Icons.done: Icons.help,
                color: approved == 'false'?  Colors.red: approved == 'true'? Colors.green: Colors.amber,
                size: 42,
              )
            ],
          ),
        ),
      ),
    ),
  );
}