import 'package:flutter/material.dart';

class TopMoviePage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return TopMovieState();
    }
}

class TopMovieState extends State<TopMoviePage> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('豆瓣电影 Top 250'),
        ),
        body: Text('data'),
      );
    }
}
