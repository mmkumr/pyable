import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/widgets/pyable_body.dart';

class KYC extends StatefulWidget {
  KYC({Key? key}) : super(key: key);

  @override
  _KYCState createState() => _KYCState();
  static String name = "kyc";
}

class _KYCState extends State<KYC> {
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
                "KYC",
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
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Collect the Biometric data of Rahul (ID:Py456wa)",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.fingerprint_rounded,
                              color: Colors.blue,
                              size: h * 0.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.face_rounded,
                              color: Colors.blue,
                              size: h * 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        name: KYC.name,
      ),
    );
  }
}
