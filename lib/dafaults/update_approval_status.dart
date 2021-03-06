import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Plant {
  int id;
  String name;
  String location;
  String use;
  String approved;
  String imgPath;
  var price;

  Plant(this.id, this.name, this.location, this.use, this.approved, this.imgPath, this.price);

  Plant.fromJson(Map json)
      : id = json['plant_id'],
        name = json['name'],
        location = json['location'],
        use = json['use'],
        approved = json['approved'],
        imgPath = json['imagePath'],
        price = json['price'];

  Map toJson() {
    return {'plant_id': id, 'name': name, 'location': location, 'use': use, 'approved': approved, 'imagePath': imgPath, 'price': price};
  }
}

class UpdateApproval extends StatefulWidget {
  const UpdateApproval({ Key? key }) : super(key: key);

  @override
  _UpdateApprovalState createState() => _UpdateApprovalState();
}

// updatePlant(plant_id, plant_name, status) async{
//   Map<String, dynamic> jsonData = {"name": plant_name, "approved": status};

//   final response = await http.put(Uri.parse("http://localhost:5000/api/v1/user/plant/" + plant_id.toString()), body: json.encode(jsonData), headers: {"Content-Type": "application/json"});

//   if (response.statusCode == 200){
//     var values = json.decode(response.body);
//     return values;

//   } else {
//     throw Exception('Failed to load plants');
//   }
// } 

class _UpdateApprovalState extends State<UpdateApproval> {
  List<Plant> plants = [];

  getPlants() async{
    final response = await http.get(Uri.parse("http://localhost:5000/api/v1/plants"));

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
        print("ID: ${plant.id}  Approved: ${plant.approved}");
      }
      return plants;

    } else {
      throw Exception('Failed to load plants');
    }
  }

  updatePlant(plant_id, plant_name, status) async{
    Map<String, dynamic> jsonData = {"name": plant_name, "approved": status};

    final response = await http.put(Uri.parse("http://localhost:5000/api/v1/user/plant/" + plant_id.toString()), body: json.encode(jsonData), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200){
      var values = json.decode(response.body);
      return values;

    } else {
      throw Exception('Failed to load plants');
    }
  } 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          'Change approval status',
          style: TextStyle(
            fontSize: 14,
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
                padding: const EdgeInsets.all(12.0),
                child: snapshot.data!.length < 1? Center(
                      child: Text('No Pending Approvals'),
                ) : GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1, mainAxisSpacing: 10),
                    itemBuilder:  (context, index) => postCard(context, snapshot.data[index].id, snapshot.data[index].name, snapshot.data[index].location, snapshot.data[index].use, snapshot.data[index].approved, snapshot.data[index].imgPath),
                ),
              );
            }
          },
        ),
    );
  }

  Widget postCard(BuildContext context, id, name, location, String use, approved, imgPath){
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shadowColor: Colors.grey[300],
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgPath),
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
                  fontSize: 24,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 4,),
                Text('$location',
                  style: TextStyle(
                  color: Color(0xff7ECA9C),
                  fontSize: 18,
                ),),
                SizedBox(height: 14,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    use + "lorem ipsum dolor imet lorem ipsum dolor imet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          updatePlant(id, name, 'true');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => super.widget));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff7ECA9C)
                      ),
                      child: Text(
                        'Approve',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 18,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          updatePlant(id, name, 'false');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => super.widget));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffEE6F57)
                      ),
                      child: Text(
                        'Decline',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




