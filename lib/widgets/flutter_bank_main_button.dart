// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/classes.dart';

class FlutterBankMainButton extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool? enabled;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? labelColor;

  const FlutterBankMainButton(
      {Key? key,
      this.onTap,
      this.label,
      this.enabled = true,
      this.icon,
      this.backgroundColor = Utils.mainThemeColor,
      this.iconColor = Colors.white,
      this.labelColor = Utils.mainThemeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color:
                enabled! ? backgroundColor : backgroundColor!.withOpacity(0.5),
            child: InkWell(
              onTap: enabled!
                  ? () {
                      onTap!();
                    }
                  : null,
              highlightColor: Colors.white.withOpacity(0.2),
              splashColor: Colors.white.withOpacity(0.1),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: icon != null,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            icon,
                            color: iconColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Text(
                        label!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
