import 'package:flutter/material.dart';
import 'auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MedSpace",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://i.ibb.co/0MSR0qf/1619838311558.png",
                        height: 150,
                      ),
                      Image.network(
                        "https://i.ibb.co/XL65cLP/20210501-151339.png",
                        height: 60,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialButton(
                        elevation: 0.0,
                        child: Text(
                          "LogIn",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side:
                              BorderSide(color: Colors.deepPurple, width: 2.5),
                        ),
                        height: 50,
                        minWidth: 300,
                        color: Colors.deepPurple,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: MaterialButton(
                          elevation: 0.0,
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.deepPurple),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(
                                color: Colors.deepPurple, width: 2.5),
                          ),
                          height: 50,
                          minWidth: 300,
                          color: Colors.black.withOpacity(0.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          )),
        ),
      ),
    );
  }
}
