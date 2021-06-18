// @dart=2.9
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyable/home.dart';
import 'package:pyable/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Auth.name,
      routes: MyRoute.names,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Auth extends StatefulWidget {
  Auth({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthState createState() => _AuthState();

  static String name = "/auth";
}

class _AuthState extends State<Auth> {
  final _loginform = GlobalKey<FormState>();
  final _signupform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff706CFC),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: "Log In",
              ),
              Tab(
                icon: Icon(Icons.person_add),
                text: "Sign UP",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              width: w,
              height: h,
              color: Color(0xff706CFC),
              child: Center(
                child: Container(
                  height: h * 0.7,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      width: w * 0.65,
                      height: h * 0.65,
                      color: Colors.white,
                      child: Form(
                        key: _loginform,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.fingerprint,
                                size: w * 0.3,
                                color: Color(0xff6DFFF0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 20, right: 20),
                              child: TextFormField(
                                //controller: _name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  icon: Icon(Icons.person),
                                  hintText: "Email-id",
                                  labelStyle: TextStyle(
                                    color: Color(0xff6DFFF0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 20, right: 20),
                              child: TextFormField(
                                //controller: _name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  icon: Icon(Icons.lock),
                                  hintText: "Password",
                                  labelStyle: TextStyle(
                                    color: Color(0xff6DFFF0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 20, right: 20),
                              child: MaterialButton(
                                height: h * 0.061,
                                minWidth: w * 0.487,
                                color: Color(0xff38AFF9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushReplacementNamed(Home.name);
                                },
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 29, color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    height: 60,
                                    color: Colors.red,
                                    shape: CircleBorder(),
                                    child: Image.asset(
                                      "assets/img/gicon.png",
                                      height: 50,
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    height: 60,
                                    color: Color(0xff4268B3),
                                    shape: CircleBorder(),
                                    child: Image.asset(
                                      "assets/img/fbicon.jpg",
                                      height: 40,
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
              ),
            ),
            Container(
              width: w,
              height: h,
              color: Color(0xff706CFC),
              child: Center(
                child: Container(
                  height: h * 0.7,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          width: w * 0.65,
                          height: h * 0.6,
                          color: Colors.white,
                          child: Form(
                            key: _signupform,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: OutlineButton(
                                    shape: CircleBorder(),
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.8),
                                        width: 1.0),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 35.0, 8.0, 35.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "Upload Image",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: TextFormField(
                                    //controller: _name,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.person),
                                      hintText: "Email-id",
                                      labelStyle: TextStyle(
                                        color: Color(0xff6DFFF0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),

                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The name field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, left: 20, right: 20),
                                  child: TextFormField(
                                    //controller: _name,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.lock),
                                      hintText: "Password",
                                      labelStyle: TextStyle(
                                        color: Color(0xff6DFFF0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),

                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The name field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, left: 20, right: 20),
                                  child: TextFormField(
                                    //controller: _name,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.lock_open),
                                      hintText: "Confirm Password",
                                      labelStyle: TextStyle(
                                        color: Color(0xff6DFFF0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),

                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The name field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, left: 20, right: 20),
                                  child: TextFormField(
                                    //controller: _name,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.phone),
                                      hintText: "Phone no.",
                                      labelStyle: TextStyle(
                                        color: Color(0xff6DFFF0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),

                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The name field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: MaterialButton(
                                    height: h * 0.061,
                                    minWidth: w * 0.487,
                                    color: Color(0xff38AFF9),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {},
                                    child: Text(
                                      "Upload Aadhar",
                                      style: TextStyle(
                                        fontSize: w * 0.06,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20, bottom: 10),
                                  child: MaterialButton(
                                    height: h * 0.061,
                                    minWidth: w * 0.487,
                                    color: Color(0xff38AFF9),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {},
                                    child: Text(
                                      "Upload Pancard",
                                      style: TextStyle(
                                        fontSize: w * 0.06,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      MaterialButton(
                        height: h * 0.061,
                        minWidth: w * 0.487,
                        color: Color(0xff38AFF9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 29, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
