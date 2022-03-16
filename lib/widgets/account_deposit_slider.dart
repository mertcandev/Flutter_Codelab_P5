// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:provider/provider.dart';

class AccountDepositSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DepositService>(builder: (context, depositService, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Amount To Deposit", style: TextStyle(color: Colors.grey)),
          Text("\$${depositService.amountToDeposit.toInt().toString()}",
              style: TextStyle(color: Colors.black, fontSize: 60)),
          Slider(
            value: depositService.amountToDeposit,
            max: 1000,
            activeColor: Utils.mainThemeColor,
            inactiveColor: Colors.grey.withOpacity(0.5),
            thumbColor: Utils.mainThemeColor,
            onChanged: (double value) {
              depositService.setAmountToDeposit(value);
            },
          )
        ],
      );
    });
  }
}
