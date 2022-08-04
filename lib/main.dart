
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:offic3/providers/productinfo_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductInfoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kColor1,
        scaffoldBackgroundColor: kColor1,
      ),
      home: FutureBuilder(
        future: Hive.openBox('dayList_screen'),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const WelcomeScreen();
            }
          } else {
            return const Scaffold(
              backgroundColor: kColor1,
            );
          }
        },
      ),
    );
  }
}
