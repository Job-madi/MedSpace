import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:http/http.dart';
import 'package:medspace/main.dart';
import 'homescreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const SERVER_IP = 'http://10.0.0.14:3001'; //replace with your ip,should
 String userID;
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _password = TextEditingController();
//Todo: to inform user someting went wrong with alert dialog
//
  Future<http.Response> login(
    String username,
    String password,
  ) {
    return http.post(
      Uri.http('10.0.0.14:3001', 'users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
        "pfpUrl": "https://i.redd.it/v0caqchbktn741.jpg"
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        })
                  ],
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "LogIn",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              hintText: "username",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: MaterialButton(
                          elevation: 0.0,
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          onPressed: () async {
                            Response resp = await login(
                                _usernameController.text, _password.text);
                            var jsonData = jsonDecode(resp.body);

                            if (jsonData['success'] == true) {
                              userID = jsonData['data']['userId'];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(
                                color: Colors.deepPurple, width: 2.5),
                          ),
                          height: 50,
                          minWidth: 150,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
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

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController liscenceNumber = TextEditingController();
  String countryPlace;
  String userID;

//need to make a plan for getting photos
  Future<http.Response> createUser(
    String username,
    String password,
  ) {
    return http.post(
      Uri.http('10.0.0.14:3001', 'users/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
        "pfpUrl": "https://i.redd.it/v0caqchbktn741.jpg"
      }),
    );
  }

  Future<http.Response> signup(String name, String medicalField,
      String licenseNumber, String country, String userID) async {
    return http.post(
      Uri.http('10.0.0.14:3001', 'doctors/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "surname": "nullfor now",
        "age": "nullfor now",
        "gender": "null gender",
        "medicalField": medicalField,
        "licenseNumber": licenseNumber,
        "post": "placeholder",
        "placeOfWork": "null yet again",
        "country": countryPlace,
        "city": "placeholder",
        "pfpUrl": 'https://hello.com',
        "userId": userID,
      }),
      /* "name": "Billy",
    "surname": "Billy Fernandez",
    "age": 5,
    "gender": "Male",
    "medicalField": "Dentist",
    "licenseNumber": "19028390123890",
    "post": "placeholder",
    "placeOfWork": "Biden's Dental Office",
    "country": "USA",
    "city": "New York",
    "pfpUrl": "https://upload.wikimedia.org/wikipedia/commons/5/53/Doctor_Mike_in_2020.jpg",*/
    );

    /*var res = await http.post(Uri.parse("$SERVER_IP/login"),
        body: {"name": name,
         "surname":surname,
        "age":age,
        "gender":gender,
        "medicalField":medicalField,
        "licenseNumber":licenseNumber,
        "placeOfWork":placeofWork,
        "country":country,
        "city":city,
        "pfpUrl":profilePicture,
         });
   return res.body;*/
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          })
                    ],
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Create New Account",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            //username controller
                            controller: _username,
                            decoration: InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            //firstname
                            controller: firstName,
                            decoration: InputDecoration(
                                hintText: "full name",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            //place of work right?
                            controller: designation,
                            decoration: InputDecoration(
                                hintText: "designation",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            //license number
                            controller: liscenceNumber,
                            decoration: InputDecoration(
                                hintText: "licence number",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            //password my fellas
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "select country",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.arrow_circle_down),
                                    onPressed: () {
                                      showCountryPicker(
                                        context: context,
                                        //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).

                                        //Optional. Shows phone code before the country name.
                                        showPhoneCode: false,
                                        onSelect: (Country country) {
                                          countryPlace = country.displayName;
                                        },
                                      );
                                    })
                              ],
                            ),
                            height: 55,
                            width: h - 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: MaterialButton(
                            elevation: 0.0,
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            onPressed: () async {
                              print(
                                  "This is username:${_username.text} and pass:${_password.text}");

                              Response res = await createUser(
                                  _username.text, _password.text);
                              var jsonData = jsonDecode(res.body);

                              print("this is jsonDAta $jsonData");
                              if (jsonData['success'] == true) {
                                //if accounts is madeit it will return sucess and user id will be given back to make actual account
                                userID = jsonData['data']['userId'];
                                print("this is userid bro $userID");

                                Response creation = await signup(
                                    firstName.text,
                                    designation.text,
                                    liscenceNumber.text,
                                    countryPlace,
                                    userID);

                                print(creation.body);
                                var jsonDatacreate = jsonDecode(creation.body);
                                print(jsonDatacreate);
                                if (jsonDatacreate['success'] == true)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(
                                  color: Colors.deepPurple, width: 2.5),
                            ),
                            height: 50,
                            minWidth: 150,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
