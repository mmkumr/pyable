import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/widgets/pyable_body.dart';

class Offers extends StatefulWidget {
  Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
  static String name = "offers";
}

class _OffersState extends State<Offers> {
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
                "My Offers",
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
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Material(child: AddOffers()),
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40),
              child: Container(
                height: h * 0.36,
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
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Item Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Type",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "value",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Valid till.",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: h * 0.36 - 50,
                        width: w * 0.725,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            String name;
                            String type;
                            String value;
                            if (index % 2 == 0) {
                              name = "Toothpaste";
                              type = "Percentage";
                              value = "5%";
                            } else {
                              name = "Soap";
                              type = "Direct";
                              value = "₹46";
                            }
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.white,
                              child: ListTile(
                                  title: Row(
                                children: [
                                  Expanded(
                                    child: Text(name),
                                  ),
                                  Expanded(
                                    child: Text(type),
                                  ),
                                  Expanded(
                                    child: Text(value),
                                  ),
                                  Expanded(
                                    child: Text("22/11/2021"),
                                  ),
                                ],
                              )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        name: Offers.name,
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
  String validDate = "";
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
                      validDate = value.toString().substring(0, 10);
                    });
                  });
                },
                leading: Icon(Icons.date_range),
                title: Text(
                  validDate == "" ? "Select valid till date" : validDate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
