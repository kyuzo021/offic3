
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/clientList_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReusableDateListCard extends StatelessWidget {
  const ReusableDateListCard({Key? key, required this.dateInput, required this.indexRDLC})
      : super(key: key);

  final String dateInput;
  //index of reusable day list card.
  final int indexRDLC;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await Hive.openBox('clientList_screen_$indexRDLC');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClientListScreen(
              indexCLS: indexRDLC,
              dateForClientScreen: dateInput,
            );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kColor2,
        ),
        margin: kStandardEdging,
        padding: const EdgeInsets.only(left: 40,right: 40, top: 3, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(CupertinoIcons.calendar_circle ,size: 40, color: kColor1,),
                    const SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color: kColor1, borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsetsDirectional.only(top: 4, bottom: 4, start: 10, end: 10),
                      child: Text(
                        dateInput,
                        style: kLabelTextStyle3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(thickness: 1, color: kColor4),
            const SizedBox(height: 2),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Total Revenue: ', style: kStandardTextStyle3,),
                    Text(' 132 \$ ', style: kStandardTextStyle3X,),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('PAID:', style: kStandardTextStyle3,),
                    Text('  NO', style: kStandardTextStyle3XX,),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.pencil,
                        color: kColor4,
                      ),
                      SizedBox(width: 3),
                      Text('EDIT', style: kStandardTextStyle4,),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kColor1,
                    minimumSize: const Size(0,0),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.delete,
                        color: kColor4,
                      ),
                      SizedBox(width: 3),
                      Text('DELETE', style: kStandardTextStyle4,),
                    ]
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kColor1,
                    minimumSize: const Size(0,0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
