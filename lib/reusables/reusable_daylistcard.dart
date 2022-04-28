import 'package:flutter/material.dart';
import 'package:offic3/constants_globals.dart';
import 'package:offic3/screens/client_overview_screen.dart';

class ReusableDayCard extends StatelessWidget {
  const ReusableDayCard({Key? key, required this.dateInput, required this.index})
      : super(key: key);

  final String dateInput;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientOverviewScreen(
              index2: index,
              dateForClientScreen: dateInput,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kColor2,
        ),
        margin: kStandardEdging,
        width: double.infinity,
        alignment: Alignment.center,
        padding: kStandardPadding,
        child: Text(
          dateInput,
          style: kLabelTextStyle,
        ),
      ),
    );
  }
}
