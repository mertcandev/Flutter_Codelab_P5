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

    FirebaseAuth.instance.signOut().then(
      (value) {
        signOutCompleter.complete(true);
      },
      onError: (error) {
        signOutCompleter.completeError({ 'error': error });
      }
    );

    return signOutCompleter.future;
  }

  Future<bool> createUserWithEmailAndPassword(String email, String pwd) async {

    try {
      UserCredential userCredentials = 
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pwd);
      
      return true; // or userCredentials != null;
      
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setLoginErrorMessage('');

    try {
      UserCredential credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  Future<List<Account>> getAccounts(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId();

    List<Account> accounts = [];

    Completer<List<Account>> accountsCompleter = Completer();

    FirebaseFirestore.instance
      .collection('accounts')
      .doc('h0e8z3spfrdYrQ467vIF3bf9qbo1') // use the one from YOUR project! 
      //.doc(userId)
      .collection('user_accounts')
      .get().then((QuerySnapshot collection) {

        for(var doc in collection.docs) {
            var acctDoc = doc.data() as Map<String, dynamic>;
            var acct = Account.fromJson(acctDoc, doc.id);
            accounts.add(acct);
        }

        Future.delayed(const Duration(seconds: 1), () {
          accountsCompleter.complete(accounts);
        });
      });

    return accountsCompleter.future;
  }

}