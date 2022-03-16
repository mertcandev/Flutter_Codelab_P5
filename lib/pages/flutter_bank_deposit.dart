// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/account_action_header.dart';
import 'package:flutter_codelab_p5/widgets/account_action_selection.dart';
import 'package:flutter_codelab_p5/widgets/account_deposit_slider.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_main_button.dart';
import 'package:flutter_codelab_p5/widgets/transaction_completion_page.dart';
import 'package:provider/provider.dart';

class FlutterBankDeposit extends StatelessWidget {
  const FlutterBankDeposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        FlutterBankService bankService =
            Provider.of<FlutterBankService>(context, listen: false);
        bankService.resetSelections();
        return Future.value(true);
      },
      child: Scaffold(
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
                    amountChanger: AccountDepositSlider(),
                  ),
                  Consumer<DepositService>(builder: (context, service, child) {
                    return FlutterBankMainButton(
                        enabled: service.checkAmountToDeposit(),
                        label: "Make Deposit",
                        onTap: service.checkAmountToDeposit()
                            ? () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TransactionCompletionPage(
                                                isDeposit: true)));
                              }
                            : null);
                  })
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
