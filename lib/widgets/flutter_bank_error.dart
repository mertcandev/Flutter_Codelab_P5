// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankError extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.warning_outlined, color: Utils.mainThemeColor, size: 80),
          SizedBox(height: 20),
          Text('Error fetching data', 
            style: TextStyle(color: Utils.mainThemeColor, fontSize: 20)
          ),
          Text('Please try again', 
            style: TextStyle(color: Colors.grey, fontSize: 12)
          )
        ]
      )
    );
  }
}
