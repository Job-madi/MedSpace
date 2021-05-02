import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:medspace/main.dart';
import 'homescreen.dart';
import 'package:http/http.dart' as http;


const SERVER_IP = 'https://localhost:5000'; //server ip,should 
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

 final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _password = TextEditingController();
//Todo: to inform user someting went wrong with alert dialog

  Future<String> logIn(String username, String password) async {
    var res = await http.post(Uri.parse("$SERVER_IP/login"),
        body: {"username": username, "password": password});
    if (res.statusCode == 200) return res.body;
    return null;
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
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextField(
                          controller: _usernameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
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

Future<String> signup(String name,String surname,int age,String gender,String medicalField,String licenseNumber,String country,String city,String profilePicture,String password,String placeofWork)async{
  var res = await http.post(Uri.parse("$SERVER_IP/login"),
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
   return res.body;

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
                            decoration: InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "full name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "designation",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "licence number",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "password",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
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
                                          // text = country.displayName;
                                        },
                                      );
                                    })
                              ],
                            ),
                            height: 55,
                            width: h - 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
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
