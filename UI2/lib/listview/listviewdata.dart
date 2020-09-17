import 'package:flutter/material.dart';
import 'post.dart';
import 'graphline.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import 'MOCK_DATA.dart';

class ListViewPosts extends StatelessWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TimeSeriesBar barrr = new TimeSeriesBar.withSampleData();

    //List<charts.Series<TimeSeriesSales, DateTime>> createSampleData;
    return new Card(
      child: ListView.builder(
          itemCount: posts.length, // itemCount: dataarray1().length,
          //padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          itemBuilder: (context, position) {
            var listTile = ListTile(
              contentPadding: EdgeInsets.fromLTRB(7, 7, 7, 30),
              title: Text(
                "   Band No:   " //
                '${posts[position].band.toString()}',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 7),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        Text(
                          "ürün adı" //'${posts[position].body}'
                          , ////
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "Ürün Kodu" //'${posts[position].body}'
                          , ////
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "üretim Tarihi" //'${posts[position].body}'
                          , ////
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    //margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                    SizedBox(height: 10),
                    //Padding: Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "ad" //'${posts[position].body}'
                            , ////
                            style: new TextStyle(
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kod" //'${posts[position].body}'
                            , ////
                            style: new TextStyle(
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Tarihi" //'${posts[position].body}'
                            , ////
                            style: new TextStyle(
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),*/

                    Container(
                        height: 200,
                        width: 300,
                        child: TimeSeriesBar.dochart(posts[position].graphy)),
                    //barrr
                    ////graph comes here
                  ]),
              onTap: () => _onTapItem(context, posts[position]),
            );
            return Column(
              children: <Widget>[
                Divider(height: 10.0),
                listTile,
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(
            post.kodu.toString() + ' - ' + post.zaman.toString() + ":00")));
  }
}

class ListViewPostsUrunkodu extends StatelessWidget {
  final List<Post> posts;

  ListViewPostsUrunkodu({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TimeSeriesBar barrr = new TimeSeriesBar.withSampleData();

    //List<charts.Series<TimeSeriesSales, DateTime>> createSampleData;
    return new Card(
      child: ListView.builder(
          itemCount: posts.length, // itemCount: dataarray1().length,
          //padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          itemBuilder: (context, position) {
            var listTile = ListTile(
              contentPadding: EdgeInsets.fromLTRB(7, 7, 7, 30),
              title: Text(
                "   Ürün Kodu:   " //
                '${posts[position].kodu.toString()}',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 7),

                    Container(
                      height: 200,
                      width: 300,
                      child: TimeSeriesBar.dochart(posts[position].graphy),
                    ),
                    //barrr
                    ////graph comes here
                  ]),
              onTap: () => _onTapItem(context, posts[position]),
            );
            return Column(
              children: <Widget>[
                Divider(height: 10.0),
                listTile,
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(
            post.kodu.toString() + ' - ' + post.zaman.toString() + ":00")));
  }
}
