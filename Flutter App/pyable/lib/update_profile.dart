import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyable/widget/sidepanel.dart';
import 'package:pyable/widget/titlebar.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
  static String name = "/updateProfile";
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff706CFC),
      appBar: AppBar(
        backgroundColor: Color(0xff706CFC),
        title: TitleBar(
          title: "Edit Profile",
          logo: false,
        ),
      ),
      drawer: SidePanel(),
      body: Center(
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
              SingleChildScrollView(
                child: Container(
                  width: w * 0.65,
                  height: h * 0.7,
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            //controller: _name,
                            decoration: InputDecoration(
                              fillColor: Color(0xff6DFFF0),
                              hintText: "Name",
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            //controller: _name,
                            decoration: InputDecoration(
                              fillColor: Color(0xff6DFFF0),
                              hintText: "Email-ID",
                              labelText: "Email-ID",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            //controller: _name,
                            decoration: InputDecoration(
                              fillColor: Color(0xff6DFFF0),
                              hintText: "Phone no.",
                              labelText: "Phone no.",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            //controller: _name,
                            decoration: InputDecoration(
                              fillColor: Color(0xff6DFFF0),
                              hintText: "UPI ID",
                              labelText: "UPI ID",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            height: h * 0.061,
                            minWidth: w * 0.487,
                            color: Color(0xff38AFF9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Save",
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
    );
  }
}
