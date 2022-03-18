// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankNoExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payments, color: Utils.mainThemeColor, size: 50),
          SizedBox(height: 20),
          Text(
            "There are no expenses\nat the moment.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Utils.mainThemeColor),
          )
        ],
      ),
    );
  }
}
