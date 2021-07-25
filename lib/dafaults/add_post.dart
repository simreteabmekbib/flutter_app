import 'package:blue_moon_flatter/dafaults/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final int user_id = 1;

class AddPost extends StatefulWidget {
  const AddPost({ Key? key }) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  final url = 'http://localhost:5000/api/v1';
  final plantNameController = TextEditingController();
  final plantImageController = TextEditingController();
  final plantLocationController = TextEditingController();
  final plantUseController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: plantNameController,
                      decoration: const InputDecoration(
                        labelText: 'Plant Name',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        )
                        // hintText: 'Plant Name',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: plantImageController,
                      decoration: const InputDecoration(
                        labelText: 'Plant Image',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        )
                        // hintText: 'Plant Image',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: plantLocationController,
                      decoration: const InputDecoration(
                        labelText: 'Finding Location',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        )
                        // hintText: 'Finding Location',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please upload image';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: plantUseController,
                      decoration: const InputDecoration(
                        labelText: 'Plant Use',
                        labelStyle: TextStyle(
                          fontSize: 12,
                        )
                        // hintText: 'Use',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter use';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff393E46),
                          onPrimary: Color(0xff7BC74D)
                        ),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                            // TODO: handle form submit
                            NewPlantPost newPlantPost = NewPlantPost(name: plantNameController.text, image: plantImageController.text, location: plantLocationController.text, use: plantUseController.text);
                            createPost(url, body: newPlantPost.toMap())
                              .then((value) {
                                if (value != ''){
                                  print('posted new plant');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Post()),
                                  );
                                } else {
                                  print('new plant not posted');
                                }
                              });
                          }
                        },
                        child: const Text('Submit for approval'),
                      ),
                    ),
                  ],
                ),
              )
        ),
      ));
  }
}


Future createPost(String url, {required Map body}) async {
  return http.post(
      Uri.parse(url + "/user/plant/" + user_id.toString()), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body)
    ).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while posting data");
    }
    // print("Message returned: " + json.decode(response.body)['message']);
    // return Posts.fromJson(json.decode(response.body));
  
    return json.decode(response.body)['plant_id'];
  });
}

class NewPlantPost{
  final String name;
  final String image;
  final String location;
  final String use;

  NewPlantPost({required this.name, required this.image, required this.location, required this.use});

  Map toMap(){
    var map = new Map();
    map['name'] = name;
    map['location'] = location;
    map['use'] = use;
    map['imagePath'] = image;
    map['approved'] = 'false';

    return map;
  }

}