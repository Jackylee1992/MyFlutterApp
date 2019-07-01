import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'MovieItemCell.dart';
import 'dart:async';
import 'Model/NetworkHelper.dart';

class TopMoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopMovieState();
  }
}

class TopMovieState extends State<TopMoviePage> {
  @override
  void initState() {
    super.initState();
  }

  var _title = '';
  var _movieItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: RefreshIndicator(
        child: getBody(_movieItems),
        onRefresh: loadMovieData,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_activity),
        onPressed: () => loadMovieData(),
      ),
    );
  }

/// action
/// 
/// 点击cell查看详情
void onClickMovieCell(Map val) {
  String movieID = val['id'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: Text('查看详情，movieID:$movieID'));
      });
}

/// 点击cell购票按钮
void onClickBuyTicketButton(Map val) {
  String movieID = val['id'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: Text('点击购票，movieID:$movieID'));
      });
}

  int _apiStartNum = 0;
  String doubanApikey = '0df993c66c0c636e29ecbb5344252a4a';

// https://api.douban.com/v2/movie/in_theaters
// https://api.douban.com/v2/movie/top250?start=$_apiStartNum&count=15
  Future<void> loadMovieData() async {
    Map result = await HttpHelper().loadMovieDataByDio();
    setState(() {
      _title = result['title'];
      _movieItems = result['subjects'];
      _apiStartNum += 10;
    });
  }

  String nameArrayString(List list) {
    List names = [];
    list.forEach((map) => names.add(map['name']));
    String result = names.join(' / ');
    return result;
  }

  Widget getBody(List items) {
    List<Widget> itemViewList = [];
    for (var item in items) {
      itemViewList.add(MovieItemCell(
        item: item, 
        checkDetailCallback: (val) => onClickMovieCell(val),
        buyTicketCallback: (val) => onClickBuyTicketButton(val)));
    }
    return ListView(
      children: itemViewList,
    );
  }
}
