import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'homescreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("LogIn - MedSpace"),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("Welcome Back!!"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.print),
                      hintText: "Enter Username",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.print),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              MaterialButton(
                elevation: 0.0,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.deepPurple, width: 2.5),
                ),
                height: 60,
                minWidth: 150,
                color: Colors.black.withOpacity(0.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("SignUp - MedSpace"),
        ),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.verified_user_rounded),
                        hintText: "Enter Username",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.flag),
                        hintText: "First Name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.print),
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.print),
                        hintText: "Gender",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text("Select country"),
                      IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 60,
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                              exclude: <String>['KN', 'MF'],
                              //Optional. Shows phone code before the country name.
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                print('Select country: ${country.displayName}');
                              },
                            );
                          })
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.print),
                        hintText: "License Number",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.print),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                ),
                MaterialButton(
                  elevation: 0.0,
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.deepPurple, width: 2.5),
                  ),
                  height: 60,
                  minWidth: 150,
                  color: Colors.black.withOpacity(0.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}