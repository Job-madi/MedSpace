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
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "FEED",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                        hintText: "search",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                  ),
                ),
                RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.purple.withOpacity(0.0),
                  onPressed: () {},
                  child: Text("Ask a question"),
                ),
                Container(
                  height: h - 260,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        lol(),
                        lol(),
                        lol(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

lol() {
  return Padding(
    padding: EdgeInsets.all(11.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Image.network(
              "https://4rai.com/images/easyblog_articles/155/chest-xray.jpg",
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              "Patient unable to breath",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              "Hey, my patient is unable to breath properly. He's on oxygen support and non-asthamatic, what should I do?",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.deepPurpleAccent[100],
                onPressed: () {},
                child: Text("Answer this Question"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.deepPurpleAccent[100],
                onPressed: () {},
                child: Text("View Answers"),
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blueAccent.withOpacity(0.15)),
    ),
  );
}
