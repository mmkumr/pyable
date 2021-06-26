import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/wallet.dart';

class BNav extends StatefulWidget {
  List<IconData?> bnIcons;
  List<String> bnTitle;
  List<VoidCallback> bnfunc;
  BNav({
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
          for (int i = 0; i < widget.bnIcons.length; i++)
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      widget.bnIcons[i],
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: widget.bnfunc[i],
                  ),
                  Text(
                    widget.bnTitle[i],
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
