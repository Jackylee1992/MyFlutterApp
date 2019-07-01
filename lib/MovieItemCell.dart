import 'package:flutter/material.dart';

class MovieItemCell extends StatelessWidget {
  const MovieItemCell({
    Key key,
    this.item,
    this.callback
  }) : super(key: key);

  final Map item;
  final callback;

  String nameArrayString(List list) {
    List names = [];
    list.forEach((map) => names.add(map['name']));
    String result = names.join(' / ');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300);
    String imageURL = item['images']['small'];
    String directors = nameArrayString(item['directors']);
    String casts = nameArrayString(item['casts']);
    return Column(children: <Widget>[
      Container(
        height: 150,
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
        // color: Colors.blue,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Image(
                  image: NetworkImage(imageURL),
                  width: 90,
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Container(
                constraints: BoxConstraints.expand(width: (screenWidth * 0.45)),
                alignment: Alignment.topLeft,
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // 评分、导演、主演
                    Text('${item['title']}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        '电影评分: ${item['rating']['average']}',
                        style: textStyle,
                      ),
                    ),
                    Text(
                      '导演: $directors',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '主演: $casts',
                      maxLines: 2,
                      softWrap: true,
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                    child: Text(
                      (item['collect_count'] / 10000).toStringAsFixed(1) +
                          '万人看过',
                      style: TextStyle(fontSize: 11, color: Colors.red),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: FlatButton(
                          child: Text(
                            '购票',
                            style: TextStyle(fontSize: 13),
                          ),
                          // color: Colors.blue,
                          textColor: Colors.red,
                          onPressed: () {
                            callback(item);
                          },
                        ),
                      ))
                ],
              )
            ]),
      ),
      Divider(
        height: 0.3,
        color: Colors.grey.withAlpha(150),
      )
    ]);
  }
}
