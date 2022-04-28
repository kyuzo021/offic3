import 'package:flutter/material.dart';
import 'package:offic3/constants_globals.dart';
import 'package:offic3/screens/welcome_screen.dart';

void main() {
  runApp(const Offic3());
}

class Offic3 extends StatelessWidget {
  const Offic3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kColor1,
        scaffoldBackgroundColor: kColor1,
      ),
      home: const WelcomeScreen(),
    );
  }
}