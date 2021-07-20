import 'package:flutter/material.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/dashboard.dart';
import 'package:pyable/main.dart';

class MyRoute {
  static Map<String, WidgetBuilder> names = <String, WidgetBuilder>{
    MyHomePage.name: (context) => MyHomePage(),
    Contact.name: (context) => Contact(),
    Dashbaord.name: (context) => Dashbaord()
  };
}