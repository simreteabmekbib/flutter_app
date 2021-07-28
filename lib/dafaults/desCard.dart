import './desCom.dart';
import 'package:flutter/material.dart';

class DesCard extends StatelessWidget {
  final DesCom? plant;

  DesCard({this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(plant?.imageUrl),
            ),
            title: Text(plant?.name),
            subtitle: Text(plant?.description),
          ),
          ],
      ),
    );
  }
}