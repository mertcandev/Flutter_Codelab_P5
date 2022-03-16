import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankTransactionCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.check_circle_outline_outlined,
            color: Utils.mainThemeColor, size: 80),
        SizedBox(height: 20),
        Text(
          "Transaction Completed",
          style: TextStyle(color: Utils.mainThemeColor, fontSize: 20),
        )
      ],
    );
  }
}
