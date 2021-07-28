import 'package:blue_moon_flatter/dafaults/buy_confirm.dart';
import 'package:blue_moon_flatter/dafaults/login.dart';
import 'package:blue_moon_flatter/dafaults/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Detail extends StatelessWidget {
  final String name, use, imgPath;
  final price;
  const Detail({ Key? key, required this.name, required this.use, required this.price, required this.imgPath }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: detailWidget(context, name, use, price, imgPath),
    );
  }
}


Widget detailWidget(BuildContext context, name, use, price, imgPath){
  return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color(0xFF4AA96C),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Image(
                  image: NetworkImage(imgPath),
                  fit: BoxFit.cover,
                  width: 375,
                  height: 180,
                ),
              ),  
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.paid),
                          style: TextButton.styleFrom(
                            primary: Color(0xff7BC74D),
                          ),
                          label: Text(
                            '$price ETB',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff393E46),
                            onPrimary: Color(0xff7BC74D),
                          ),
                          onPressed: () {
                            if (FlutterSession().get('email').toString() !=''){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BuyConfirm(name: name, price: price)),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            }
                            
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Text(
                              'Buy',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text( use + 
                      ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do',
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      )
    );
}


// class Detail extends StatefulWidget {
//   const Detail({ Key? key }) : super(key: key);

//   @override
//   _DetailState createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Some Image Detail'),
//         backgroundColor: Color(0xFF4AA96C),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                 child: Image(
//                   image: AssetImage('assets/images/profile.jpg'),
//                   fit: BoxFit.cover,
//                   width: 375,
//                   height: 180,
//                 ),
//               ),  
//               Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(28.0),
//                     child: Text(
//                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do',
//                       style: TextStyle(
//                         height: 1.5,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         TextButton.icon(
//                           onPressed: () {},
//                           icon: Icon(Icons.paid),
//                           style: TextButton.styleFrom(
//                             primary: Color(0xff7BC74D),
//                           ),
//                           label: Text(
//                             '30 ETB',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xff393E46),
//                             onPrimary: Color(0xff7BC74D),
//                           ),
//                           onPressed: () {
//                             if (loggedIn){
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => BuyConfirm()),
//                               );
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => SignUp()),
//                               );
//                             }
                            
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 22.0),
//                             child: Text(
//                               'Buy',
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//       )
//     );
//   }
// }

