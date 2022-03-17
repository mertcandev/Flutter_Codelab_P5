// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_main_button.dart';
import 'package:provider/provider.dart';

class FlutterAccountRegistration extends StatefulWidget {
  @override
  FlutterAccountRegistrationState createState() =>
      FlutterAccountRegistrationState();
}

class FlutterAccountRegistrationState
    extends State<FlutterAccountRegistration> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Utils.mainThemeColor),
            backgroundColor: Colors.transparent,
            title: const Icon(Icons.savings,
                color: Utils.mainThemeColor, size: 40),
            centerTitle: true),
        body: Container(
            padding: const EdgeInsets.all(30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    // title
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: const Text('Create New Account',
                            style: TextStyle(
                                color: Utils.mainThemeColor, fontSize: 20))),
                    // email field
                    Utils.generateInputField(
                        'Email', Icons.email, usernameController, false,
                        (text) {
                      setState(() {});
                    }),
                    // password field
                    Utils.generateInputField(
                        'Password', Icons.lock, passwordController, true,
                        (text) {
                      setState(() {});
                    }),
                    // password confirmation field
                    Utils.generateInputField('Confirm Password', Icons.lock,
                        confirmPasswordController, true, (text) {
                      setState(() {});
                    }),
                  ])),
              FlutterBankMainButton(
                  label: 'Register',
                  enabled: validateFormFields(),
                  onTap: () async {
                    String username = usernameController.value.text;
                    String pwd = passwordController.value.text;

                    bool accountCreated = await loginService
                        .createUserWithEmailAndPassword(username, pwd);

                    if (accountCreated) {
                      Navigator.of(context).pop();
                    }
                  })
            ])));
  }

  bool validateFormFields() {
    return Utils.validateEmail(usernameController.value.text) &&
        usernameController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        confirmPasswordController.value.text.isNotEmpty &&
        (passwordController.value.text == confirmPasswordController.value.text);
  }
}
