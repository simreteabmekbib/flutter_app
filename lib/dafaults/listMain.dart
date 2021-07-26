import './listModel.dart';
import './listCom.dart';
import './listCard.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesPageState();
  }
}

class _MoviesPageState extends State<MoviesPage> {
  final List<ListCom> movies = MovieList.getMovies();

  Widget _buildMoviesList() {
    return Container(
      child: movies.length > 0
          ? ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      movies.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: PlantCard(plant: movies[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plants List',
        style: TextStyle(
            fontSize: 14,
          ),
        ),
        backgroundColor: Color(0xff7ECA9C),),      
      body: _buildMoviesList(),
    );
  }
}