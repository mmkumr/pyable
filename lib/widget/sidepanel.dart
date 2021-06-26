import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/home.dart';
import 'package:pyable/kyc.dart';
import 'package:pyable/profile.dart';
import 'package:pyable/update_profile.dart';

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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Refer and get rewarded"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Refer this app to your friend and get reward of 50Rs. to your wallet."
                                "\nPress the refer button and share your refferal code."
                                "If he/she will uses the refferal code while transfering money for the first time. You will get rewarded.",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  //controller: _name,
                                  initialValue: "PY1932",
                                  readOnly: true,

                                  decoration: InputDecoration(
                                    fillColor: Color(0xff6DFFF0),
                                    labelText: "Referral Code",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The name field cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Color(0xff38AFF9),
                            child: Text("Refer Someone"),
                          ),
                        ],
                      ));
            },
            child: ListTile(
              leading: Icon(FontAwesomeIcons.userFriends),
              title: Text(
                "Refer Your Friend",
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Kyc.name);
            },
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
            onTap: () {
              Navigator.of(context).pushNamed(UpdateProfile.name);
            },
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
