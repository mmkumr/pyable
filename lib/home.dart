// @dart=2.9
import 'dart:ui';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyable/wallet.dart';
import 'package:pyable/widget/bottomNavBar.dart';
import 'package:pyable/widget/drawer.dart';
import 'package:pyable/widget/titlebar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  static String name = "/home";
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String qrcode = "";
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
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.exchangeAlt),
                text: "Payment history",
              ),
            ],
          ),
        ),
        drawer: SidePanel(),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                ),
                Text(
                  "Send Money",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              height: 80,
                              color: Colors.white,
                              shape: CircleBorder(),
                              onPressed: () {},
                              child: Icon(
                                Icons.people,
                                size: 40,
                                color: Color(0xff38AFF9),
                              ),
                            ),
                          ),
                          Text(
                            "Phone no.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              height: 80,
                              color: Colors.white,
                              shape: CircleBorder(),
                              onPressed: () {},
                              child: Icon(
                                FontAwesomeIcons.university,
                                size: 40,
                                color: Color(0xff38AFF9),
                              ),
                            ),
                          ),
                          Text(
                            "Wallet to bank",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "People",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8.0),
                  itemCount: 8,
                  shrinkWrap: true,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Container(
                        child: FractionallySizedBox(
                          heightFactor: 0.6,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/img/photo.jpg"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      footer: Text(
                        "Mukesh",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Offers",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        leading: Text("Coupon code\nOFF20"),
                        title: Text("20% off on adding money to wallet."),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.copy),
                        ),
                      ),
                    );
                  },
                )
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
                        "+1,23,000",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.asset("assets/img/loginlogo.png"),
                      title: Text("Random Name"),
                      trailing: Text(
                        "-12,000",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(
            Icons.qr_code,
            size: 50,
            color: Color(0xff38AFF9),
          ),
          backgroundColor: Colors.white,
          onPressed: () async {
            if (await Permission.camera.status.isDenied) {
              Permission.camera.request();
            }
            try {
              BarcodeScanner.scan().then(
                (value) {
                  setState(() => qrcode = value);
                },
              );
            } on PlatformException catch (e) {
              if (e.code == BarcodeScanner.CameraAccessDenied) {
                setState(() {
                  print('The user did not grant the camera permission!');
                });
              } else {
                print('Unknown error: $e');
              }
            } on FormatException {
              print(
                  'null (User returned using the "back"-button before scanning anything.');
            } catch (e) {
              print('Unknown error: $e');
            }
            Future.delayed(const Duration(seconds: 3), () {
              if (qrcode != "") {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    content: Text(qrcode),
                  ),
                );
                qrcode = "";
              }
            });
          },
        ),
        bottomNavigationBar: BNav(
          scaffoldKey: _scaffoldKey,
          bnIcons: [
            FontAwesomeIcons.rupeeSign,
            FontAwesomeIcons.wallet,
          ],
          bnTitle: [
            "Transfer money\nto wallet",
            "Wallet",
          ],
          bnfunc: [
            () {},
            () {
              Navigator.of(context).pushNamed(Wallet.name);
            },
          ],
        ),
      ),
    );
  }
}
