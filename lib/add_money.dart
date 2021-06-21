import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/widget/sidepanel.dart';
import 'package:pyable/widget/titlebar.dart';

class AddMoney extends StatefulWidget {
  AddMoney({Key? key}) : super(key: key);

  @override
  _AddMoneyState createState() => _AddMoneyState();
  static String name = "/addMoney";
}

class _AddMoneyState extends State<AddMoney> {
  TextEditingController _amount = TextEditingController();
  TextEditingController _coupon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff706CFC),
      appBar: AppBar(
        backgroundColor: Color(0xff706CFC),
        title: TitleBar(
          title: "Add Money",
          logo: false,
        ),
      ),
      drawer: SidePanel(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _amount,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(FontAwesomeIcons.moneyBillWave),
                hintText: "Amount",
                labelStyle: TextStyle(
                  color: Color(0xff6DFFF0),
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
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextFormField(
              controller: _coupon,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(FontAwesomeIcons.percent),
                hintText: "Coupon",
                labelStyle: TextStyle(
                  color: Color(0xff6DFFF0),
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
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: MaterialButton(
              height: h * 0.061,
              minWidth: w * 0.487,
              color: Color(0xff38AFF9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                _amount.clear();
              },
              child: Text(
                "Add Money",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
