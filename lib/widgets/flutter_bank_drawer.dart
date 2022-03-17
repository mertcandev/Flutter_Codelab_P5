// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.mainThemeColor,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.savings, color: Colors.white, size: 60),
          const SizedBox(height: 40),
          Material(
            color: Colors.transparent,

            // rest of the code omitted for brevity...
            child: TextButton(
              style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1))
              ),
              child: const Text('Sign Out', textAlign: TextAlign.left, 
                style: TextStyle(color: Colors.white)
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Utils.signOutDialog(context);
              },
            )


          )
        ]
      )
    );
  }
}
