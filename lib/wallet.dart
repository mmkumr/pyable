import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/loginlogo.png",
              height: 40,
            ),
            Text(
              "PYABLE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
