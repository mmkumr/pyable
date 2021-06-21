import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final userType;
  User({this.userType});

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: h * 0.8,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.userType,
                    style: TextStyle(
                      color: Color(0xff6DFFF0),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: w * 0.65,
                    height: h * 0.7,
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          TextFormField(
                            //controller: _name,
                            decoration: InputDecoration(
                              fillColor: Color(0xff6DFFF0),
                              hintText: "Full Name",
                              labelText: "Full Name",
                              labelStyle: TextStyle(
                                color: Color(0xff6DFFF0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xff6DFFF0),
                              )),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The name field cannot be empty";
                              }
                              return null;
                            },
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              height: h * 0.061,
                              minWidth: w * 0.487,
                              color: Color(0xff6DFFF0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Save and Next",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
