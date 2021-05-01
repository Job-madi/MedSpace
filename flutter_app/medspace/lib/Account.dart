import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
