// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/pages/flutter_bank_splashpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( FlutterBankApp());
}

class FlutterBankApp extends StatelessWidget {
  const FlutterBankApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      ),
      debugShowCheckedModeBanner: false,
      home: FlutterBankSplash(),
      
    );
  }
}