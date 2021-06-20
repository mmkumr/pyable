import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/wallet.dart';

class BNav extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<IconData?> bnIcons;
  List<String> bnTitle;
  List<VoidCallback> bnfunc;
  BNav({
    required this.scaffoldKey,
    required this.bnIcons,
    required this.bnTitle,
    required this.bnfunc,
  });

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
                    widget.bnIcons[0],
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: widget.bnfunc[0],
                ),
                Text(
                  widget.bnTitle[0],
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
                    widget.bnIcons[1],
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: widget.bnfunc[1],
                ),
                Text(
                  widget.bnTitle[1],
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
