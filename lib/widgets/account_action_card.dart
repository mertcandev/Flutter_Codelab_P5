// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:provider/provider.dart';

class AccountActionCard extends StatelessWidget {

  final List<Account>? accounts;
  final Account? selectedAccount;

  const AccountActionCard({ this.accounts, this.selectedAccount });

  @override
  Widget build(BuildContext context) {

    FlutterBankService bankService = 
      Provider.of<FlutterBankService>(context, listen: false);

    return Row(
      children: List.generate(accounts!.length, (index) {
        var currentAccount = accounts![index];
        return Expanded(
          child: GestureDetector(
            onTap: () {
              bankService.setSelectedAccount(currentAccount);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20, offset: const Offset(0.0, 5.0)
                  )
                ],
                border: Border.all(
                  width: 5,
                  color: selectedAccount != null && 
                    selectedAccount!.id == currentAccount.id ? 
                      Utils.mainThemeColor : Colors.transparent
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${currentAccount.type!.toUpperCase()} ACCT', 
                    style: const TextStyle(color: Utils.mainThemeColor)
                  ),
                  Text(currentAccount.accountNumber!)
                ]
              )
            ),
          ),
        );
      })
    );
  }


}