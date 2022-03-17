// ignore_for_file: unused_element

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:provider/provider.dart';

class LoginService extends ChangeNotifier {
  String _userId = '';
  String _errorMessage = '';

  String getErrorMessage() {
    return _errorMessage;
  }

  void setLoginErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  String getUserId() {
    return _userId;
  }

  Future<bool> signOut() {
    Completer<bool> signOutCompleter = Completer();

    FirebaseAuth.instance.signOut().then((value) {
      signOutCompleter.complete(true);
    }, onError: (error) {
      signOutCompleter.completeError({'error': error});
    });

    return signOutCompleter.future;
  }

  Future<bool> createUserWithEmailAndPassword(String email, String pwd) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setLoginErrorMessage('');

    try {
      UserCredential credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _userId = credentials.user!.uid;

      return true;
    } on FirebaseAuthException catch (ex) {
      setLoginErrorMessage('Error during sign-in: ' + ex.message!);
      return false;
    }
  }
}

class FlutterBankService extends ChangeNotifier {
  Account? selectedAccount;

  void setSelectedAccount(Account? acct) {
    selectedAccount = acct;
    notifyListeners();
  }

  void resetSelections() {
    setSelectedAccount(null);
  }

  Account? getSelectedAccount() {
    return selectedAccount;
  }

  Future<List<Account>> getAccounts(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId();

    List<Account> accounts = [];

    Completer<List<Account>> accountsCompleter = Completer();

    FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('user_accounts')
        .get()
        .then((QuerySnapshot collection) {
      for (var doc in collection.docs) {
        var acctDoc = doc.data() as Map<String, dynamic>;
        var acct = Account.fromJson(acctDoc, doc.id);
        accounts.add(acct);
      }

      Future.delayed(const Duration(seconds: 1), () {
        accountsCompleter.complete(accounts);
      });
    }, onError: (error) {
      accountsCompleter.completeError({'error': error});
    });

    return accountsCompleter.future;
  }

  Future<bool> performDeposit(BuildContext context) {
    Completer<bool> depositComplete = Completer();

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId();

    DepositService depositService =
        Provider.of<DepositService>(context, listen: false);
    int amountToDeposit = depositService.amountToDeposit.toInt();

    DocumentReference doc = FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('user_accounts')
        .doc(selectedAccount!.id!);

    doc.update({'balance': selectedAccount!.balance! + amountToDeposit}).then(
        (value) {
      depositService.resetDepositService();
      depositComplete.complete(true);
    }, onError: (error) {
      depositComplete.completeError({'error': error});
    });

    return depositComplete.future;
  }

  Future<bool> performWithdrawal(BuildContext context) {
    Completer<bool> withdrawComplete = Completer();

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId();

    WithdrawalService wService =
        Provider.of<WithdrawalService>(context, listen: false);
    int amountToWithdraw = wService.amountToWithdraw.toInt();

    DocumentReference doc = FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('user_accounts')
        .doc(selectedAccount!.id!);

    doc.update({'balance': selectedAccount!.balance! - amountToWithdraw}).then(
        (value) {
      wService.resetWithdrawalService();
      withdrawComplete.complete(true);
    }, onError: (error) {
      withdrawComplete.completeError({'error': error});
    });

    return withdrawComplete.future;
  }
}

class DepositService extends ChangeNotifier {
  double amountToDeposit = 0;

  void setAmountToDeposit(double amount) {
    amountToDeposit = amount;
    notifyListeners();
  }

  void resetDepositService() {
    amountToDeposit = 0;
    notifyListeners();
  }

  bool checkAmountToDeposit() {
    return amountToDeposit > 0;
  }
}

class WithdrawalService extends ChangeNotifier {
  double amountToWithdraw = 0;

  void setAmountToWithdraw(double amount) {
    amountToWithdraw = amount;
    notifyListeners();
  }

  void resetWithdrawalService() {
    amountToWithdraw = 0;
    notifyListeners();
  }

  bool checkAmountToWithdraw() {
    return amountToWithdraw > 0;
  }
}
