// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_error.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_loading.dart';
import 'package:flutter_codelab_p5/widgets/transaction_completed.dart';
import 'package:provider/provider.dart';

class TransactionCompletionPage extends StatelessWidget {
  final bool? isDeposit;

  const TransactionCompletionPage({Key? key, this.isDeposit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterBankService bankService =
        Provider.of<FlutterBankService>(context, listen: false);

    Future.delayed(Duration(seconds: 3), () {
      bankService.resetSelections();
      Navigator.of(context).pop();
    });

    return WillPopScope(
      onWillPop: () {
        bankService.resetSelections();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Utils.mainThemeColor),
          backgroundColor: Colors.transparent,
          title: Icon(
            Icons.savings,
            color: Utils.mainThemeColor,
            size: 40,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
              future: bankService.performDeposit(context),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return FlutterBankLoading();
                }
                if (snapshot.hasError) {
                  return FlutterBankError();
                }
                return FlutterBankTransactionCompleted();
              }),
        ),
      ),
    );
  }
}
