import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/home.dart';
import 'package:pyable/profile.dart';

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
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Profile.name);
            },
            child: UserAccountsDrawerHeader(
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
                "KYC",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(FontAwesomeIcons.moneyBillWave),
              title: Text(
                "Extra Credit (Mini loan)",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                "assets/img/shop.png",
                height: 30,
              ),
              title: Text(
                "Stores",
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
            onTap: () {
              Navigator.of(context).pushNamed(Contact.name);
            },
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
