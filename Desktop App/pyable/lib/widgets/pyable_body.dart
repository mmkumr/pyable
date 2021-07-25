import 'package:flutter/material.dart';
import 'package:pyable/offers.dart';
import 'package:pyable/widgets/sidepanel.dart';

class PyableBody extends StatefulWidget {
  Widget child;
  String name;
  PyableBody({Key? key, required this.child, required this.name})
      : super(key: key);

  @override
  _PyableBodyState createState() => _PyableBodyState();
}

class _PyableBodyState extends State<PyableBody> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/dashboard.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 40,
            child: Container(
              height: 70,
              width: w * 0.9,
              decoration: BoxDecoration(
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Color(0xff4A90E4),
                      onPressed: () {
                        Navigator.pushNamed(context, Offers.name);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            "My Offers",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "My Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            right: 15,
                            bottom: 8.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xffF9FAFE),
            width: w * 0.9,
            height: h * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SidePanel(
                    name: widget.name,
                  ),
                ),
                widget.child,
              ],
            ),
          )
        ],
      ),
    );
  }
}
