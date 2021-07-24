import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({ Key? key }) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

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