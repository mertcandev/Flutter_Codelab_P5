// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/account_action_header.dart';
import 'package:flutter_codelab_p5/widgets/account_action_selection.dart';

class FlutterBankDeposit extends StatelessWidget {
  const FlutterBankDeposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Utils.mainThemeColor),
        backgroundColor: Colors.transparent,
        title: Icon(Icons.savings, color: Utils.mainThemeColor, size: 40),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            AccountActionHeader(headerTitle: "Deposit", icon: Icons.login),
            Expanded(
                child: Column(
              children: [
                AccountActionSelection(
                  actionTypeLabel: "To",
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
