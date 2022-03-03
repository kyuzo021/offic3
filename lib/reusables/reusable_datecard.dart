
import 'package:flutter/material.dart';
import 'package:offic3/constants_globalmethods.dart';

class ReusableCard1 extends StatelessWidget {
  const ReusableCard1({required this.datetxt});

  final String datetxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kColor2,
      ),
      margin: kStandardEdging,
      width: double.infinity,
      alignment: Alignment.center,
      padding: kStandardPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                datetxt,
                style: kLabelTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: kColor1,
                ),
                onPressed: null,
              ),
              IconButton(
                iconSize: 25,
                icon: Icon(
                  Icons.mode_outlined,
                  color: kColor1,
                ),
                onPressed: null,
              ),
              IconButton(
                iconSize: 32,
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: kColor1,
                ),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
