// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/classes.dart';
import 'package:flutter_codelab_p5/pages/flutter_bank_login.dart';

class FlutterBankSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FlutterBankLogin()));
    });

    return Scaffold(
      backgroundColor: Utils.mainThemeColor,
      body: Stack(
        children: [
          Center(
            child: Icon(Icons.savings, color: Colors.white, size: 60),
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
