import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SidePanel extends StatefulWidget {
  SidePanel({Key? key}) : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff706CFC),
            ),
            accountName: Text(
              "John Wick",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "doglover@gmail.com",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(FontAwesomeIcons.userFriends),
              title: Text(
                "Refer Your Friend",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(FontAwesomeIcons.fingerprint),
              title: Text(
                "Update Biometrics",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.perm_identity),
              title: Text(
                "Update Profile",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.call),
              title: Text(
                "Contact Us",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
