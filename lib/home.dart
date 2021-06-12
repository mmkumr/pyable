import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyable/widget/bottomNavBar.dart';
import 'package:pyable/widget/drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          backgroundColor: Color(0xff706CFC),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff706CFC),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.exchangeAlt),
                  text: "Payment history",
                ),
              ],
            ),
          ),
          drawer: SidePanel(),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "People",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    itemCount: 8,
                    shrinkWrap: true,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: Container(
                          child: FractionallySizedBox(
                            heightFactor: 0.6,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/photo.jpg"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        footer: Text(
                          "Mukesh",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Offers",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        child: ListTile(
                          leading: Text("Coupon code\nOFF20"),
                          title: Text("20% off on adding money to wallet."),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.copy),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset("assets/img/photo.jpg"),
                        title: Text("Mukesh Kumar"),
                        trailing: Text(
                          "+1,23,000",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset("assets/img/loginlogo.png"),
                        title: Text("Random Name"),
                        trailing: Text(
                          "-12,000",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            child: Icon(Icons.add),
            backgroundColor: Color(0xff38AFF9),
            onPressed: () {
              var alert = AlertDialog(
                title: Text("Send Money"),
                content: Container(
                  width: w,
                  height: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                IconButton(
                                  color: Color(0xff38AFF9),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.qr_code,
                                    size: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Scan QR code"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                IconButton(
                                  color: Color(0xff38AFF9),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.contacts,
                                    size: 40,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Sent to contacts"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    color: Color(0xff38AFF9),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              );
              showDialog(context: context, builder: (_) => alert);
            },
          ),
          bottomNavigationBar: BNav(
            scaffoldKey: _scaffoldKey,
          ),
        ),
      ),
    );
  }
}
