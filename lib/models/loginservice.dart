// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService extends ChangeNotifier {
  String _userId = "";
  String _errorMessage = "";

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

  Future<bool> createUserWithEmailAndPassword(String email, String pwd) async {
    try {
      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);

      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      _userId = credentials.user!.uid;

      return true;
    } on FirebaseAuthException catch (ex) {
      setLoginErrorMessage("Error during sign-in: " + ex.message!);
      return false;
    }
  }
}
