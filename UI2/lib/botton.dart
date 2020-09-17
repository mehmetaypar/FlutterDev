import 'home_page.dart';
import 'loginpage.dart';
import 'package:flutter/material.dart';
import 'deneme.dart';

import 'package:ccc/listview/listviewdata.dart';
import 'package:ccc/listview/post.dart';
import 'package:ccc/listview/MOCK_DATA.dart';
import 'package:ccc/sorgu.dart';

import 'package:ccc/listview/piechart.dart';

class Liste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewPosts(posts: parsePosts(ddata)),
    );
  }
}

class Liste2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewPostsUrunkodu(posts: parsePostsUrunkodu(ddata)),
    );
  }
}

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selected = 0;
  static const TextStyle optionStyles = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static List<Widget> _widgetOpation = <Widget>[
    //SignUp(),

    Liste(),
    Sorgu(),
    Liste2(),

    /*  Container(
        height: 200,
        width: 300,
        child: DonutAutoLabelChart.doChart(dataarrayPie())),
    */
    HomePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOpation.elementAt(_selected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xf2db, fontFamily: 'band'),
              ),
              title: Text('Üretim \n   Bandı')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pageview,
              ),
              title: Text('Sorgula')),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xf1b2, fontFamily: 'panda'),
              ),
              title: Text('Ürün \n Kodu')),

          /*BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home')),*/
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
