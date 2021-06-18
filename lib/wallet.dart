import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pyable/receive.dart';
import 'package:pyable/send.dart';
import 'package:pyable/widget/drawer.dart';
import 'package:pyable/widget/titlebar.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();

  static String name = "/wallet";
}

class _WalletState extends State<Wallet> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String qrcode = "";
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Color(0xff706CFC),
      appBar: AppBar(
        backgroundColor: Color(0xff706CFC),
        title: TitleBar(
          title: "Wallet",
          logo: false,
        ),
      ),
      drawer: SidePanel(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "₹ 4,357\nWallet Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.08,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Credit Limit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                new CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  radius: w * 0.8,
                  lineWidth: w * 0.06,
                  percent: 0.60,
                  backgroundColor: Color(0xff38AFF9),
                  linearGradient: LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.white,
                      Colors.yellowAccent,
                    ],
                  ),
                  center: new Text(
                    "60%\n0 - 45,620",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: MaterialButton(
                    height: h * 0.061,
                    minWidth: w * 0.487,
                    color: Color(0xff38AFF9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text(
                      "How to increase credit limit",
                      style: TextStyle(
                        fontSize: w * 0.06,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                    right: 8,
                    left: 8,
                  ),
                  child: Container(
                    color: Color(0xff38AFF9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You can send or receive money, "
                        "to the wallet. Even if there is no internet connection."
                        "You can sent or receive money in this mode when sender and reciever are nearby.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
      bottomNavigationBar: Container(
        height: h * 0.12,
        color: Color(0xff38AFF9),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (await Permission.location.status.isDenied) {
                        Permission.location.request();
                      }
                      Navigator.of(context).pushNamed(Send.name);
                    },
                  ),
                  Text(
                    "send",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.reply,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (await Permission.location.status.isDenied) {
                        Permission.location.request();
                      }
                      Navigator.of(context).pushNamed(Receive.name);
                    },
                  ),
                  Text(
                    "Recieve",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
