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
      child: Column(
        children: [
          postCard(Icons.done),
          postCard(Icons.close),
          postCard(Icons.help)
        ],
      ),
    );
  }
}

Widget postCard(icon){
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
          image: AssetImage('assets/images/profile.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Plant Name',
            style: TextStyle(
              color: Colors.white
            ),),
            Text('Plant finding Locaiton',
              style: TextStyle(
              color: Colors.white
            ),),
            Text('Plant Use',
            style: TextStyle(
              color: Colors.white
            ),),
            Icon(
              icon,
              color: icon == Icons.close?  Colors.red: icon == Icons.done? Colors.green: Colors.amber,
            )
          ],
        ),
      ),
    ),
  );
}