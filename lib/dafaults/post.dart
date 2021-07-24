import 'package:blue_moon_flatter/dafaults/add_post.dart';
import 'package:blue_moon_flatter/dafaults/view_posts.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({ Key? key }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  
  int _currentIndex = 0;
  final tabs = [
    AddPost(),
    ViewPosts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 36,
        title: Text(
          _currentIndex == 0? 'Post Finding': 'All Posts',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0Xff393E46),
        fixedColor: Color(0xff7BC74D),
        unselectedItemColor: Colors.grey[200],
        selectedIconTheme: IconThemeData(
          size: 28
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toc),
            label: 'Posts',
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}