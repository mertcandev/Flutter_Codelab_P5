// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/account_action_header.dart';
import 'package:flutter_codelab_p5/widgets/expense_card.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_error.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_loading.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_main_button.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_no_expenses.dart';
import 'package:provider/provider.dart';

class FlutterBankExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterBankService bankService =
        Provider.of<FlutterBankService>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Utils.mainThemeColor),
          backgroundColor: Colors.transparent,
          title: Icon(Icons.savings, color: Utils.mainThemeColor, size: 40),
          centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AccountActionHeader(
              icon: Icons.payments,
              headerTitle: "My Expenses",
            ),
            Expanded(
                child: StreamBuilder<List<Expense>>(
              stream: bankService.getExpenses(context),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return FlutterBankLoading();
                }
                if (snapshot.hasError) {
                  return FlutterBankError();
                }
                var expenses = snapshot.data as List<Expense>;
                if (expenses.isEmpty) {
                  return FlutterBankNoExpenses();
                }
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    var expense = expenses[index];
                    return ExpenseCard(
                      expense: expense,
                      onDeleteExpense: () {
                        bankService.deleteExpense(context, expense.id!);
                      },
                    );
                  },
                );
              },
            )),
            SizedBox(height: 20),
            FlutterBankMainButton(
              label: "Add Expense",
              onTap: () {
                bankService.addExpense(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
