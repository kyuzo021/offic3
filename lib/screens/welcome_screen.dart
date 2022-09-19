
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/dateList_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offic3/hive/hive_client_screen.dart';
import 'package:offic3/providers/productdata_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(
      const Duration(seconds: 3),
        () async{
        //this section loads the client screen id.
        await Hive.openBox('clientScreen_id');
        Iterable idDataForClientScreen = await retrieveIdDataForClientScreen();
        for(String x in idDataForClientScreen) {
          context.read<ProductDataProvider>().loadClientScreen(x);
        }
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const DateListScreen()
            ));
        }
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome to the Offic3',
                  textStyle: kLabelTextStyle,
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
