// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 80,
            height: 80,
            child: Stack(children: const [
              Center(
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Utils.mainThemeColor)))),
              Center(
                  child: Icon(Icons.savings,
                      color: Utils.mainThemeColor, size: 40))
            ])));
  }
}
