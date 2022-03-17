// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:provider/provider.dart';

class AccountWithdrawalSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<FlutterBankService>(
      builder: (context, bankService, child) {
        return Consumer<WithdrawalService>(
          builder: (context, withdrawalService, child) {

            double amountToWithdraw = withdrawalService.amountToWithdraw;
            double currentBalance = bankService.selectedAccount!.balance!;
            double actualAmount = amountToWithdraw > currentBalance ? 
              currentBalance : amountToWithdraw;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Amount To Withdraw', style: 
                TextStyle(color: Colors.grey)),
                Text('\$${actualAmount.toInt().toString()}',
                  style: const TextStyle(color: Colors.black, fontSize: 60)
                ),
                Slider(
                  value: actualAmount,
                  max: bankService.selectedAccount!.balance!,
                  activeColor: Utils.mainThemeColor,
                  inactiveColor: Colors.grey.withOpacity(0.5),
                  thumbColor: Utils.mainThemeColor,
                  onChanged: (double value) {
                    withdrawalService.setAmountToWithdraw(value);
                  }
                )
              ]
            );
          }
        );
      },
    );
  }
}