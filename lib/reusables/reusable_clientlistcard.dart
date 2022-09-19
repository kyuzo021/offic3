
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/screens/client_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReusableClientListCard extends StatelessWidget {
  const ReusableClientListCard({Key? key, required this.clientNameInput, required this.indexRCLC, required this.indexCLS})
      : super(key: key);

  final String clientNameInput;
  //index for reusable client list cards.
  final int indexRCLC;
  final int indexCLS;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await Hive.openBox('productPrices_${indexCLS.toString() + indexRCLC.toString()}');
        await Hive.openBox('productCounts_${indexCLS.toString() + indexRCLC.toString()}');
        await Hive.openBox('productNames_${indexCLS.toString() + indexRCLC.toString()}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientScreen(
              indexCS: indexRCLC,
              clientName: clientNameInput,
              indexCLS: indexCLS,
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
        padding: kStandardPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(CupertinoIcons.person_crop_square ,size: 40, color: kColor1,),
                  const SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                        color: kColor1, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsetsDirectional.only(top: 4, bottom: 4, start: 10, end: 10),
                    child: Text(
                      clientNameInput,
                      style: kLabelTextStyle3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('TOTAL:', style: kStandardTextStyle3,),
                      Text(' 132 \$', style: kStandardTextStyle3X,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Text('PAID:', style: kStandardTextStyle3,),
                      Text('  NO', style: kStandardTextStyle3XX,),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.pencil,
                      color: kColor4,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: kColor1,
                      shape: const CircleBorder(),
                      minimumSize: const Size(0,0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.delete,
                      color: kColor4,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: kColor1,
                      shape: const CircleBorder(),
                      minimumSize: const Size(0,0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Text(
// clientNameInput,
// style: kLabelTextStyle,
// ),