import 'package:flutter/material.dart';
import 'views/homepage.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: HomePage(),
    );
  }
}

newsTemplate(double w) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Container(
      width: w - 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue[200],
            Colors.purple[200],
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(
              "Title",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Few Details",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
