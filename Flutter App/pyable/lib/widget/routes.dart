import 'package:flutter/material.dart';
import 'package:pyable/add_money.dart';
import 'package:pyable/contact.dart';
import 'package:pyable/home.dart';
import 'package:pyable/kyc.dart';
import 'package:pyable/main.dart';
import 'package:pyable/money_withdraw.dart';
import 'package:pyable/person_history.dart';
import 'package:pyable/profile.dart';
import 'package:pyable/receive.dart';
import 'package:pyable/send.dart';
import 'package:pyable/send_to_contact.dart';
import 'package:pyable/update_profile.dart';
import 'package:pyable/wallet.dart';

class MyRoute {
  static Map<String, WidgetBuilder> names = <String, WidgetBuilder>{
    Auth.name: (context) => Auth(),
    Home.name: (context) => Home(),
    Wallet.name: (context) => Wallet(),
    Send.name: (context) => Send(),
    Receive.name: (context) => Receive(),
    Contact.name: (context) => Contact(),
    MoneyWithdraw.name: (context) => MoneyWithdraw(),
    Profile.name: (context) => Profile(),
    AddMoney.name: (context) => AddMoney(),
    UpdateProfile.name: (context) => UpdateProfile(),
    SendToContact.name: (context) => SendToContact(),
    Kyc.name: (context) => Kyc(),
  };
}
