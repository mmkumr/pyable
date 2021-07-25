import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/app_settings.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/dashboard.dart';

class SidePanel extends StatefulWidget {
  String name;
  SidePanel({Key? key, required this.name}) : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.65,
      width: 100,
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
          //you can set more BoxShadow() here
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if (widget.name != Dashbaord.name) {
                  Navigator.pushNamed(context, Dashbaord.name);
                }
              },
              child: Column(
                children: [
                  Icon(
                    Icons.dashboard_rounded,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.exchangeAlt,
                  color: Colors.blueGrey,
                ),
                Text(
                  "Transfer Money",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppSettings.name);
            },
            child: Column(
              children: [
                Icon(
                  Icons.settings_rounded,
                  color: Colors.blueGrey,
                ),
                Text(
                  "App Settings",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Contact.name);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    "Contact Us",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
