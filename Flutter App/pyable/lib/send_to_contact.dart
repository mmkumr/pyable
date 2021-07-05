import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:pyable/widget/sidepanel.dart';
import 'package:pyable/widget/titlebar.dart';

class SendToContact extends StatefulWidget {
  SendToContact({Key? key}) : super(key: key);

  @override
  _SendToContactState createState() => _SendToContactState();
  static String name = "/sendToContact";
}

class _SendToContactState extends State<SendToContact> {
  bool loading = false;
  String _searchTerm = "";
  final Algolia _algoliaApp = Algolia.init(
    applicationId: 'EUO6MHVURH', //ApplicationID
    apiKey:
        '38c326d51c3f113d6500c9fa502ab8e7', //search-only api key in flutter code
  );

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("phone_no").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff706CFC),
      appBar: AppBar(
        backgroundColor: Color(0xff706CFC),
        title: TitleBar(
          title: "Send Money",
          logo: false,
        ),
      ),
      drawer: SidePanel(),
      body: Center(
        child: loading == true
            ? CircularProgressIndicator()
            : Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        //controller: _name,
                        onChanged: (word) {
                          setState(() {
                            _searchTerm = word;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Phone no.",
                          icon: Icon(Icons.phone),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
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
                    StreamBuilder<List<AlgoliaObjectSnapshot>>(
                      stream: Stream.fromFuture(_operation((_searchTerm))),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Start Typing",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        } else {
                          List<AlgoliaObjectSnapshot>? currSearchStuff =
                              snapshot.data;

                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "searching.....",
                                  textAlign: TextAlign.center,
                                ),
                              ));
                            default:
                              if (snapshot.hasError)
                                return new Text('Error: ${snapshot.error}');
                              else
                                return CustomScrollView(
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          return _searchTerm.length > 0
                                              ? DisplaySearchResult(
                                                  name: currSearchStuff![index]
                                                      .data["name"],
                                                  dp: currSearchStuff[index]
                                                      .data["dp"],
                                                  id: currSearchStuff[index]
                                                      .data["id"],
                                                  pno: currSearchStuff[index]
                                                      .data["pno"],
                                                )
                                              : Container();
                                        },
                                        childCount: currSearchStuff!.length,
                                      ),
                                    ),
                                  ],
                                );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  
}

class DisplaySearchResult extends StatelessWidget {
  final String name;
  final String pno;
  final String dp;
  final String id;
  DisplaySearchResult({
    Key? key,
    required this.name,
    required this.dp,
    required this.pno,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Image.network(dp),
        title: Text(name),
        subtitle: Text(pno),
      ),
    );
  }
}
