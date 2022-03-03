// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/classes.dart';
import 'package:flutter_codelab_p5/models/loginservice.dart';
import 'package:flutter_codelab_p5/pages/flutter_account_registration.dart';
import 'package:flutter_codelab_p5/pages/flutter_bank_main.dart';
import 'package:flutter_codelab_p5/widgets/flutter_bank_main_button.dart';
import 'package:provider/provider.dart';

class FlutterBankLogin extends StatefulWidget {
  @override
  State<FlutterBankLogin> createState() => _FlutterBankLoginState();
}

class _FlutterBankLoginState extends State<FlutterBankLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(width: 7, color: Utils.mainThemeColor),
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.savings,
                color: Utils.mainThemeColor,
                size: 45,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Welcome to",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(
              "Flutter\nSavings Bank",
              style: TextStyle(color: Utils.mainThemeColor, fontSize: 30),
            ),
            Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sign Into Your Bank Account",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      onChanged: ((text) {
                        setState(() {});
                      }),
                      style: TextStyle(fontSize: 16),
                      controller: userNameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.email, color: Utils.mainThemeColor),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 20, bottom: 11, top: 11, right: 15),
                          hintText: "Email"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      style: TextStyle(fontSize: 16),
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Utils.mainThemeColor,
                        ),
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 20, top: 11, bottom: 11, right: 15),
                        hintText: "Password",
                      ),
                    ),
                  )
                ],
              ),
            )),
            Consumer<LoginService>(
              builder: (context, lService, child) {
                String errorMsg = lService.getErrorMessage();

                if (errorMsg.isEmpty) {
                  return SizedBox(height: 40);
                }
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        errorMsg,
                        style: TextStyle(color: Colors.red),
                      ))
                    ],
                  ),
                );
              },
            ),
            FlutterBankMainButton(
              label: "Sign In",
              enabled: validateEmailAndPassword(),
              onTap: () async {
                var username = userNameController.value.text;
                var pwd = passwordController.value.text;

                bool isLoggedIn = await loginService.signInWithEmailAndPassword(
                    username, pwd);

                if (isLoggedIn) {
                  userNameController.clear();
                  passwordController.clear();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FlutterBankMain()));
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            FlutterBankMainButton(
              label: "Register",
              icon: Icons.account_circle,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlutterAccountRegistration()));
              },
              backgroundColor: Utils.mainThemeColor.withOpacity(0.05),
              iconColor: Utils.mainThemeColor,
              labelColor: Utils.mainThemeColor,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validateEmailAndPassword() {
    return userNameController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        Utils.validateEmail(userNameController.value.text);
  }
}
