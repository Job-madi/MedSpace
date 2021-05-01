import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("trying"),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: h - 160,
                width: double.infinity,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[container(), container(), container()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
