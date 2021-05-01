import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.deepPurple,
                      ],
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 100,
                        child: Image.network(
                          "https://i.pinimg.com/originals/d3/f9/13/d3f913b8dd27fac04b26c2c9a903610d.png",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          Text(
                            "Designation",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          Flag(
                            'in',
                            height: 36,
                            width: 54,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.amber[500],
                            Colors.lightBlueAccent,
                          ],
                        ),
                      ),
                      height: 130,
                      // color: Colors.pink,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                "Medcoins balance:",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              "0",
                              style: TextStyle(fontSize: 40),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.pink[200],
                            Colors.amber[200],
                          ],
                        ),
                      ),
                      height: 130,
                      // color: Colors.pink,
                      child: Center(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Text("Withdraw"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
// ToggleButtons(children: , isSelected: isSelected)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue,
                            Colors.deepPurple,
                          ],
                        ),
                      ),
                      height: 40,
                      // color: Colors.pink,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "LogOut",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
