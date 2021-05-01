import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medspace/Account.dart';
import 'package:medspace/auth.dart';
import 'package:medspace/news.dart';
import 'home.dart';

int _page = 0;
GlobalKey _bottomNavigationKey = GlobalKey();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final _pageOptions = [Home(), News(), Account()];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOut,
        buttonBackgroundColor: Colors.purple[200],
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple[200],
        height: 60,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.article_outlined, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: _pageOptions[selectedPage],
    );
  }
}

container() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      color: Colors.grey.withOpacity(0.3),
      height: 200,
      width: double.maxFinite,
      child: Row(
        children: <Widget>[
          Text("Name"),
          Icon(Icons.arrow_upward),
        ],
      ),
    ),
  );
}
