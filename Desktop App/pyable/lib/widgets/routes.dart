import 'package:flutter/material.dart';
import 'package:pyable/app_settings.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/dashboard.dart';
import 'package:pyable/kyc.dart';
import 'package:pyable/main.dart';
import 'package:pyable/offers.dart';

class MyRoute {
  static Map<String, WidgetBuilder> names = <String, WidgetBuilder>{
    MyHomePage.name: (context) => MyHomePage(),
    Contact.name: (context) => Contact(),
    Dashbaord.name: (context) => Dashbaord(),
    Offers.name: (context) => Offers(),
    AppSettings.name: (context) => AppSettings(),
    KYC.name: (context) => KYC(),
  };
}
