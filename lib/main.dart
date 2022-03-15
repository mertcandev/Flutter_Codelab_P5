// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/services.dart';
import 'package:flutter_codelab_p5/pages/flutter_bank_deposit.dart';
import 'package:flutter_codelab_p5/pages/flutter_bank_splashpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCBuqOlfR_HrHXeKTBN0WeFJkxkJFS4Mxc",
          authDomain: "flutter-bank-project.firebaseapp.com",
          projectId: "flutter-bank-project",
          storageBucket: "flutter-bank-project.appspot.com",
          messagingSenderId: "967504387433",
          appId: "1:967504387433:web:d411768f538db37c33b1f8"));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginService(),
    ),
    ChangeNotifierProvider(
      create: (_) => FlutterBankService(),
    ),
    ChangeNotifierProvider(
      create: (_) => DepositService(),
    )
  ], child: FlutterBankApp()));
}

class FlutterBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        home: FlutterBankDeposit());
  }
}
