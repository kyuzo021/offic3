import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/client_screen.dart';

class ReusableClientListCard extends StatelessWidget {
  const ReusableClientListCard({Key? key, required this.clientNameInput, required this.indexRCLC})
      : super(key: key);

  final String clientNameInput;
  //index for reusable client list card.
  final int indexRCLC;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientScreen(
              indexCS: indexRCLC,
              clientName: clientNameInput,
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
        // width: double.infinity,
        // alignment: Alignment.center,
        padding: kStandardPadding,
        child: Column(
          children: [
                Text(
                  clientNameInput,
                  style: kLabelTextStyle,
                ),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total:132", style: kStandardTextStyle2,),
                SizedBox(width: 20,),
                Text("Charged:Yes", style: kStandardTextStyle2,),
              ],
            ),
          ],
        )
      ),
    );
  }
}