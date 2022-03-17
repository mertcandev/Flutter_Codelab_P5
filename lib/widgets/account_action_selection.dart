// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/account_action_card.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_error.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_loading.dart';
import 'package:provider/provider.dart';

class AccountActionSelection extends StatelessWidget {
  final String? actionTypeLabel;
  final Widget? amountChanger;

  const AccountActionSelection(
      {this.actionTypeLabel, required this.amountChanger});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlutterBankService>(builder: (context, service, child) {
      return FutureBuilder(
          future: service.getAccounts(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return FlutterBankLoading();
            }

            if (snapshot.hasError) {
              return FlutterBankError();
            }

            var selectedAccount = service.getSelectedAccount();
            List<Account> accounts = snapshot.data as List<Account>;

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(actionTypeLabel!,
                      style: const TextStyle(color: Colors.grey, fontSize: 15)),
                  const SizedBox(height: 10),
                  AccountActionCard(
                    selectedAccount: selectedAccount,
                    accounts: accounts,
                  ),
                  Expanded(
                      child: Visibility(
                    visible: selectedAccount != null,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: const Text('Current Balance',
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.monetization_on,
                                    color: Utils.mainThemeColor, size: 25),
                                Text(
                                    selectedAccount != null
                                        ? '\$' +
                                            selectedAccount.balance!
                                                .toStringAsFixed(2)
                                        : '',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 35))
                              ]),
                          Expanded(
                            child: amountChanger!,
                          )
                        ]),
                  ))
                ]);
          });
    });
  }
}
