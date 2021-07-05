import 'dart:ui';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyable/wallet.dart';
import 'package:pyable/widget/bottomNavBar.dart';
import 'package:pyable/widget/sidepanel.dart';
import 'package:pyable/widget/titlebar.dart';

class MoneyWithdraw extends StatefulWidget {
  MoneyWithdraw({Key? key}) : super(key: key);

  @override
  _MoneyWithdrawState createState() => _MoneyWithdrawState();
  static String name = "/moneyWithdraw";
}

class _MoneyWithdrawState extends State<MoneyWithdraw> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String qrcode = "";
  TextEditingController _amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Color(0xff706CFC),
        appBar: AppBar(
          backgroundColor: Color(0xff706CFC),
          title: TitleBar(
            title: "PYABLE",
            logo: true,
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.university),
                text: "Withdraw from wallet",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.history),
                text: "Transfer Status",
              ),
            ],
          ),
        ),
        drawer: SidePanel(),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _amount,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(FontAwesomeIcons.moneyBillWave),
                      hintText: "Amount",
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
                      if (value!.isEmpty) {
                        return "The name field cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: MaterialButton(
                    height: h * 0.061,
                    minWidth: w * 0.487,
                    color: Color(0xff38AFF9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _amount.clear();
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                        leading: Image.asset("assets/img/photo.jpg"),
                        title: Text("Mukesh Kumar"),
                        trailing: Text(
                          "1,23,000",
                          style: TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                        subtitle: Text("Status: Processing")),
                  );
                } else {
                  return Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Image.asset("assets/img/loginlogo.png"),
                          title: Text("Random Name"),
                          trailing: Text(
                            "12,000",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          subtitle: Text("Error: Bank Server Down!"),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: ListTile(
                            leading: Image.asset("assets/img/photo.jpg"),
                            title: Text("Mukesh Kumar"),
                            trailing: Text(
                              "13,000",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            subtitle: Text("Status: Successfull")),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
