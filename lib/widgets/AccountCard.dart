// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:intl/intl.dart';

class AccountCard extends StatelessWidget {
  
  final Account? account;
  const AccountCard({ Key? key, this.account }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0.0, 5.0)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('${account!.type!.toUpperCase()} ACCT', textAlign: TextAlign.left, 
                style: const TextStyle(color: Utils.mainThemeColor, fontSize: 12)),
              Text('**** ${account!.accountNumber}')
            ]
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Balance', textAlign: TextAlign.left, 
                style: TextStyle(color: Utils.mainThemeColor, fontSize: 12)
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Utils.mainThemeColor, size: 30),
                  Text('\$${account!.balance!.toStringAsFixed(2)}', 
                    style: const TextStyle(color: Colors.black, fontSize: 35)
                  )
                ]
              ),
              Text('As of ${DateFormat.yMd().add_jm().format(DateTime.now())}', 
                style: const TextStyle(fontSize: 10, color: Colors.grey)
              )
            ]
          )
        ]
      )
    );
  }
}
