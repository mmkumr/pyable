import 'package:flutter/material.dart';
import 'package:pyable/main.dart';
import 'package:pyable/receive.dart';
import 'package:pyable/send.dart';
import 'package:pyable/wallet.dart';
import 'home.dart';

class MyRoute {
  static Map<String, WidgetBuilder> names = <String, WidgetBuilder>{
    Auth.name: (context) => Auth(),
    Home.name: (context) => Home(),
    Wallet.name: (context) => Wallet(),
    Send.name: (context) => Send(),
    Receive.name: (context) => Receive(),
  };
}
