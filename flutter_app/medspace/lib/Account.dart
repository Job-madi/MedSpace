import 'package:flutter/material.dart';

class account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Account Details"),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
            ),
            Text("Name"),
            Text("Designation"),
            Text("Country"),
            Text("Medcoins balance:"),
// ToggleButtons(children: , isSelected: isSelected)
            MaterialButton(
              onPressed: () {},
              child: Text("LogOut"),
            )
          ],
        ),
      ),
    );
  }
}
