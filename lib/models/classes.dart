// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Utils {
  static const Color mainThemeColor = Color(0xff8700c3);

  static bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = RegExp(pattern);

    return (value != null || value!.isNotEmpty || regex.hasMatch(value));
  }

  static Widget generateInputField(
      String hintText,
      IconData iconData,
      TextEditingController controller,
      bool isPasswordField,
      Function onChanged) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(),
      child: TextField(
        onChanged: (text) {
          onChanged(text);
        },
        obscureText: isPasswordField,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            prefixIcon: Icon(iconData, color: Utils.mainThemeColor),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hintText),
        controller: controller,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
