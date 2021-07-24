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
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9, mainAxisSpacing: 10),
        itemBuilder: (context, index) => postCard(Icons.done),
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
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.65),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Plant Name',
                style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(height: 4,),
              Text('Plant Location',
                style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(height: 4,),
              Text('Plant Use',
              style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(height: 4,),
              Icon(
                icon,
                color: icon == Icons.close?  Colors.red: icon == Icons.done? Colors.green: Colors.amber,
                size: 42,
              )
            ],
          ),
        ),
      ),
    ),
  );
}