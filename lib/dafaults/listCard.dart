import './listCom.dart';
import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final ListCom? plant;

  PlantCard({this.plant});

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
            trailing: Text(plant?.price,
          ),
          ),],
      ),
    );
  }
}