import 'package:flutter/material.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({ Key? key }) : super(key: key);

  @override
  _ViewPostsState createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('view posts'),
    );
  }
}