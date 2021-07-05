import 'package:flutter/material.dart';
import 'package:pyable/widget/sidepanel.dart';
import 'package:pyable/widget/titlebar.dart';

class Kyc extends StatefulWidget {
  Kyc({Key? key}) : super(key: key);

  @override
  _KycState createState() => _KycState();
  static String name = "/kyc";
}

class _KycState extends State<Kyc> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff706CFC),
        appBar: AppBar(
          backgroundColor: Color(0xff706CFC),
          title: TitleBar(
            title: "KYC",
            logo: false,
          ),
        ),
        drawer: SidePanel(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 20.0,
                    right: 8,
                    left: 8,
                  ),
                  child: Container(
                    color: Color(0xff38AFF9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Meaning of labels\n"
                        "1. (Uploaded): After verification your document will be uploaded as kyc\n"
                        "2. (Verifying): Uploded document is in the process of verification.\n"
                        "3. No/other labels means, document is not uploaded.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: MaterialButton(
                    height: h * 0.061,
                    minWidth: w * 0.487,
                    color: Color(0xff38AFF9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text(
                      "Adhar(uploaded)",
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                  ),
                  child: MaterialButton(
                    height: h * 0.061,
                    minWidth: w * 0.487,
                    color: Color(0xff38AFF9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text(
                      "PAN(Verifying)",
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                  ),
                  child: MaterialButton(
                    height: h * 0.061,
                    minWidth: w * 0.487,
                    color: Color(0xff38AFF9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text(
                      "FingerPrints(2)",
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
