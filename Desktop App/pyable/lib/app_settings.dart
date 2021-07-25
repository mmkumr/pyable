import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/dashboard.dart';
import 'package:pyable/widgets/pyable_body.dart';
import 'package:pyable/widgets/sidepanel.dart';

class AppSettings extends StatefulWidget {
  AppSettings({Key? key}) : super(key: key);

  @override
  _AppSettingsState createState() => _AppSettingsState();
  static String name = "app_settings";
}

class _AppSettingsState extends State<AppSettings> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.paypal,
                color: Colors.grey,
              ),
              Text(
                "App Settings",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
      ),
      body: PyableBody(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40),
              child: Container(
                height: h * 0.6,
                width: w * 0.725,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: state,
                          decoration: InputDecoration(
                            hintText: "State",
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(Icons.location_searching_rounded),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The password field cannot be empty";
                            } else if (value.length < 6) {
                              return "the password has to be at least 6 characters long";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: city,
                          decoration: InputDecoration(
                            hintText: "City",
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(Icons.location_city_rounded),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The password field cannot be empty";
                            } else if (value.length < 6) {
                              return "the password has to be at least 6 characters long";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          color: Colors.green,
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {}
                              Navigator.of(context).pushNamed(Dashbaord.name);
                            },
                            minWidth: 150,
                            height: 40,
                            child: Text(
                              "Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        name: AppSettings.name,
      ),
    );
  }
}

class AddOffers extends StatefulWidget {
  AddOffers({Key? key}) : super(key: key);

  @override
  _AddOffersState createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _value = TextEditingController();
  String valid_date = "";
  String type = "Normal";
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w * 0.25,
      height: h * 0.50,
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: "Item Name",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(Icons.shopping_bag),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The name field cannot be empty";
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Text(
                  "Type of offer: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: DropdownButton<String>(
                      value: type,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        "Normal",
                        "Percentage",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Select the type of offer"),
                      onChanged: (value) {
                        setState(() {
                          type = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _value,
                decoration: InputDecoration(
                  hintText: "Value",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(Icons.shopping_bag),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The value field cannot be empty";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () async {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    setState(() {
                      valid_date = value.toString().substring(0, 10);
                    });
                  });
                },
                leading: Icon(Icons.date_range),
                title: Text(
                    valid_date == "" ? "Select valid till date" : valid_date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
