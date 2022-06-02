
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/clientlist_screen.dart';

class ReusableDayListCard extends StatelessWidget {
  const ReusableDayListCard({Key? key, required this.dateInput, required this.index})
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
            builder: (context) => ClientListScreen(
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
        child: Column(
          children: [
            Text(
              "Date: $dateInput",
              style: kLabelTextStyle2,
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total:130\$", style: kStandardTextStyle3,),
                SizedBox(width: 20,),
                Text("Charged:Yes/No", style: kStandardTextStyle3,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
