// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/account_action_header.dart';
import 'package:flutter_codelab_p5/widgets/account_action_selection.dart';
import 'package:flutter_codelab_p5/widgets/account_withdrawal_slider.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_main_button.dart';
import 'package:flutter_codelab_p5/widgets/transaction_completion_page.dart';
import 'package:provider/provider.dart';

class FlutterBankWithdrawal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Utils.mainThemeColor),
        backgroundColor: Colors.transparent,
        title: const Icon(Icons.savings, color: Utils.mainThemeColor, size: 40),
        centerTitle: true
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AccountActionHeader(headerTitle: 'Withdraw', icon: Icons.logout),
            Expanded(
              child: AccountActionSelection(
                actionTypeLabel: 'From',
                amountChanger: AccountWithdrawalSlider(),  
              ),
            ),
            Consumer<WithdrawalService>(
              builder: (context, withdrawalService, child) {
                return FlutterBankMainButton(
                  enabled: withdrawalService.checkAmountToWithdraw(),
                  label: 'Make Withdrawal',
                  onTap: withdrawalService.checkAmountToWithdraw() ? (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => 
                          const TransactionCompletionPage(isDeposit: false))
                      );
                    } : null
                );
              }
            )
          ]
        )
      )
    );
  }
}
