import 'package:flutter/material.dart';
import 'package:offic3/constants_globalmethods.dart';
import 'screens/date_screen.dart';

void main() {
  runApp(const OfficePage());
}

class OfficePage extends StatelessWidget {
  const OfficePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kColor1,
        scaffoldBackgroundColor: kColor1,
      ),
      home: const DayPage(),
    );
  }
}
