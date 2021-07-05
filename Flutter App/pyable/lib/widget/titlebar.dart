import 'package:flutter/material.dart';
import 'package:pyable/home.dart';

class TitleBar extends StatefulWidget {
  String title;
  bool logo;
  TitleBar({
    Key? key,
    required this.title,
    required this.logo,
  }) : super(key: key);

  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(Home.name);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.logo,
            child: Image.asset(
              "assets/img/loginlogo.png",
              height: 40,
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
