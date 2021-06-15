import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BNav extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  BNav({required this.scaffoldKey});

  @override
  _BNavState createState() => _BNavState();
}

class _BNavState extends State<BNav> {
  @override
  Widget build(BuildContext context) {
    var screenh = MediaQuery.of(context).size.height;
    var screenw = MediaQuery.of(context).size.width;
    return Container(
      height: screenh * 0.12,
      color: Color(0xff38AFF9),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.rupeeSign,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "Transfer money\nto wallet",
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
                    FontAwesomeIcons.wallet,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "Wallet",
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
    );
  }
}
