// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense? expense;
  final Function? onDeleteExpense;

  const ExpenseCard({Key? key, this.expense, this.onDeleteExpense})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: Offset(0.0, 5.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense!.name!,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12),
              ),
              Row(
                children: [
                  Icon(Icons.monetization_on,
                      color: Utils.mainThemeColor, size: 20),
                  Text(
                    "\$${expense!.amount!.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  )
                ],
              ),
              Text(
                DateFormat.yMd()
                    .add_jm()
                    .format(DateTime.parse(expense!.timestamp!)),
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.grey),
                onPressed: () {
                  onDeleteExpense!();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
