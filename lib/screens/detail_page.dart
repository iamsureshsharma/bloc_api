import 'package:bloc_api/data/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Data movieData;
  DetailPage({@required this.movieData});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              widget.movieData.id,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(widget.movieData.name),
          ),
        ],
      ),
    );
  }
}
