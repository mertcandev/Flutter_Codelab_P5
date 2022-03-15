// ignore_for_file: unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/widgets/account_action_card.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_error.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_loading.dart';
import 'package:provider/provider.dart';

class AccountActionSelection extends StatelessWidget {
  final String? actionTypeLabel;

  const AccountActionSelection({Key? key, this.actionTypeLabel});

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
                Text(
                  actionTypeLabel!,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(height: 10),
                AccountActionCard(
                  selectedAccount: selectedAccount,
                  accounts: accounts,
                )
              ],
            );
          });
    });
  }
}
