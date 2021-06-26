// @dart=2.9
import 'dart:ui';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyable/add_money.dart';
import 'package:pyable/money_withdraw.dart';
import 'package:pyable/person_history.dart';
import 'package:pyable/send_to_contact.dart';
import 'package:pyable/wallet.dart';
import 'package:pyable/widget/bottomNavBar.dart';
import 'package:pyable/widget/sidepanel.dart';
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
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SendToContact.name);
                              },
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
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MoneyWithdraw.name);
                              },
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
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PersonHistory(id: "93py3e"),
                          ),
                        );
                      },
                      child: GridTile(
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
                          onPressed: () async {
                            await Clipboard.setData(
                                new ClipboardData(text: "OFF20"));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("OFF20"),
                            ));
                          },
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
            scan().then((value) {
              if (qrcode != "null") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(qrcode),
                  ),
                );
              }
            });
          },
        ),
        bottomNavigationBar: BNav(
          bnIcons: [
            FontAwesomeIcons.rupeeSign,
            FontAwesomeIcons.wallet,
          ],
          bnTitle: [
            "Transfer money\nto wallet",
            "Wallet",
          ],
          bnfunc: [
            () {
              Navigator.of(context).pushNamed(AddMoney.name);
            },
            () {
              Navigator.of(context).pushNamed(Wallet.name);
            },
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.qrcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.qrcode = 'null';
        });
      } else {
        setState(() => this.qrcode = 'null');
      }
    } on FormatException {
      setState(() => this.qrcode = 'null');
    } catch (e) {
      setState(() => this.qrcode = 'null');
    }
  }
}
