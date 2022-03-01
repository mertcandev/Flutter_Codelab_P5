// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/classes.dart';

class FlutterBankLogin extends StatefulWidget {
  const FlutterBankLogin({Key? key}) : super(key: key);

  @override
  State<FlutterBankLogin> createState() => _FlutterBankLoginState();
}

class _FlutterBankLoginState extends State<FlutterBankLogin> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            ))
          ],
        ),
      ),
    );
  }
}
