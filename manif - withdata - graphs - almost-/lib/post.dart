/*class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
//{"band": 2, "kodu": 4, "zaman": "6:11", "serinumarası": "60-178-5272"},*/

import 'package:charts_flutter/flutter.dart' as charts;

import 'graphline.dart';

class Post {
  final int band;
  final String kodu;
  final List<TimeSeriesSales> graphy;
  final int zaman;
  final int adet;
  List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  Post({this.band, this.kodu, this.graphy, this.adet, this.zaman});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      band: json['band'] as int,
      kodu: json['kodu'] as String,
      zaman: json['zaman'] as int,
      adet: json['adet'] as int,
    );
  }
}
