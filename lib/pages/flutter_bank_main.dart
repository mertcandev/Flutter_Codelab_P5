// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/AccountCard.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_bottom_bar.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_drawer.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_loading.dart';
import 'package:provider/provider.dart';

class FlutterBankMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(child: FlutterBankDrawer()),
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Utils.mainThemeColor),
          backgroundColor: Colors.transparent,
          title:
              const Icon(Icons.savings, color: Utils.mainThemeColor, size: 40),
          centerTitle: true),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: const [
              Icon(Icons.account_balance_wallet,
                  color: Utils.mainThemeColor, size: 30),
              SizedBox(width: 10),
              Text('My Accounts',
                  style: TextStyle(color: Utils.mainThemeColor, fontSize: 20))
            ]),
            const SizedBox(height: 20),
            Expanded(child: Consumer<FlutterBankService>(
                builder: (context, bankService, child) {
              return FutureBuilder(
                  future: bankService.getAccounts(context),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done ||
                        !snapshot.hasData) {
                      return FlutterBankLoading();
                    }

                    List<Account> accounts = snapshot.data as List<Account>;

                    if (accounts.isEmpty) {
                      return Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                            Icon(Icons.account_balance_wallet,
                                color: Utils.mainThemeColor, size: 50),
                            SizedBox(height: 20),
                            Text(
                                'You don\'t have any accounts\nassociated with your profile.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Utils.mainThemeColor))
                          ]));
                    }

                    return ListView.builder(
                        itemCount: accounts.length,
                        itemBuilder: (context, index) {
                          var acct = accounts[index];
                          return AccountCard(account: acct);
                        });
                  });
            }))
          ])),
      bottomNavigationBar: FlutterBankBottomBar(),
    );
  }
}
