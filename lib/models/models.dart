import 'package:flutter/material.dart';

class Account {
  
  String? id;
  String? type;
  String? accountNumber;
  double? balance;
  
  Account({ this.id, this.type, this.accountNumber, this.balance });
  
  factory Account.fromJson(Map<String, dynamic> json, String docId) {
    return Account(
      id: docId,
      type: json['type'],
      accountNumber: json['account_number'],
      balance: json['balance']
    );
  }
}

class FlutterBankBottomBarItem {

  String? label;
  IconData? icon;
  Function? action;

  FlutterBankBottomBarItem({ this.label, this.icon, this.action });
}