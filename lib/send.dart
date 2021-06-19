import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pyable/wallet.dart';
import 'package:pyable/widget/titlebar.dart';

class Send extends StatefulWidget {
  Send({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
  static String name = "/send";
}

class _SendState extends State<Send> {
  final String userName = Random().nextInt(10000).toString();
  final Strategy strategy = Strategy.P2P_STAR;
  Map<String, ConnectionInfo> endpointMap = Map();

  String? tempFileUri; //reference to the file currently being transferred
  Map<int, String> map = Map();
  TextEditingController _amount = TextEditingController();
  @override
  initState() {
    super.initState();
    search();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        backgroundColor: Color(0xff706CFC),
        appBar: AppBar(
          backgroundColor: Color(0xff706CFC),
          title: TitleBar(
            title: "Send",
            logo: false,
          ),
        ),
        body: endpointMap.length == 0
            ? Center(
                child: Text(
                  "Your sender ID is: $userName\nWaiting for receiver......",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: TextFormField(
                      controller: _amount,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.person),
                        hintText: "Email-id",
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
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: MaterialButton(
                      height: h * 0.061,
                      minWidth: w * 0.487,
                      color: Color(0xff38AFF9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        endpointMap.forEach((key, value) {
                          String a = _amount.text;
                          showSnackbar(
                              "Sent $a to ${value.endpointName}, id: $key");
                          Nearby().sendBytesPayload(
                              key, Uint8List.fromList(a.codeUnits));
                        });
                        _amount.clear();
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(fontSize: 29, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<bool> _onBack() async {
    Nearby().stopDiscovery();
    Nearby().stopAllEndpoints();
    return true;
  }

  void search() async {
    try {
      bool a = await Nearby().startDiscovery(
        userName,
        strategy,
        onEndpointFound: (id, name, serviceId) {
          // show sheet automatically to request connection
          showModalBottomSheet(
            context: context,
            builder: (builder) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text("id: " + id),
                    Text("Name: " + name),
                    Text("ServiceId: " + serviceId),
                    ElevatedButton(
                      child: Text("Request Connection"),
                      onPressed: () {
                        Navigator.pop(context);
                        Nearby().requestConnection(
                          userName,
                          id,
                          onConnectionInitiated: (id, info) {
                            onConnectionInit(id, info);
                          },
                          onConnectionResult: (id, status) {
                            showSnackbar(status);
                          },
                          onDisconnected: (id) {
                            setState(() {
                              endpointMap.remove(id);
                            });
                            showSnackbar(
                                "Disconnected from: ${endpointMap[id]!.endpointName}, id $id");
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        onEndpointLost: (id) {
          showSnackbar(
              "Lost discovered Endpoint: ${endpointMap[id]!.endpointName}, id $id");
        },
      );
      showSnackbar("DISCOVERING: " + a.toString());
    } catch (e) {
      showSnackbar(e);
    }
  }

  void showSnackbar(dynamic a) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(a.toString()),
    ));
  }

  Future<bool> moveFile(String uri, String fileName) async {
    String parentDir = (await getExternalStorageDirectory())!.absolute.path;
    final b =
        await Nearby().copyFileAndDeleteOriginal(uri, '$parentDir/$fileName');

    showSnackbar("Moved file:" + b.toString());
    return b;
  }

  /// Called upon Connection request (on both devices)
  /// Both need to accept connection to start sending/receiving
  void onConnectionInit(String id, ConnectionInfo info) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Center(
          child: Column(
            children: <Widget>[
              Text("id: " + id),
              Text("Token: " + info.authenticationToken),
              Text("Name" + info.endpointName),
              Text("Incoming: " + info.isIncomingConnection.toString()),
              ElevatedButton(
                child: Text("Accept Connection"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    endpointMap[id] = info;
                  });
                  Nearby().acceptConnection(
                    id,
                    onPayLoadRecieved: (endid, payload) async {
                      if (payload.type == PayloadType.BYTES) {
                        String str = String.fromCharCodes(payload.bytes!);
                        showSnackbar(endid + ": " + str);

                        if (str.contains(':')) {
                          // used for file payload as file payload is mapped as
                          // payloadId:filename
                          int payloadId = int.parse(str.split(':')[0]);
                          String fileName = (str.split(':')[1]);

                          if (map.containsKey(payloadId)) {
                            if (tempFileUri != null) {
                              moveFile(tempFileUri!, fileName);
                            } else {
                              showSnackbar("File doesn't exist");
                            }
                          } else {
                            //add to map if not already
                            map[payloadId] = fileName;
                          }
                        }
                      } else if (payload.type == PayloadType.FILE) {
                        showSnackbar(endid + ": File transfer started");
                        tempFileUri = payload.uri;
                      }
                    },
                    onPayloadTransferUpdate: (endid, payloadTransferUpdate) {
                      if (payloadTransferUpdate.status ==
                          PayloadStatus.IN_PROGRESS) {
                        print(payloadTransferUpdate.bytesTransferred);
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.FAILURE) {
                        print("failed");
                        showSnackbar(endid + ": FAILED to transfer file");
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.SUCCESS) {
                        showSnackbar("Payment Successful.:)");

                        if (map.containsKey(payloadTransferUpdate.id)) {
                          //rename the file now
                          String name = map[payloadTransferUpdate.id]!;
                          moveFile(tempFileUri!, name);
                        } else {
                          //bytes not received till yet
                          map[payloadTransferUpdate.id] = "";
                        }
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text("Reject Connection"),
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    await Nearby().rejectConnection(id);
                  } catch (e) {
                    showSnackbar(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
