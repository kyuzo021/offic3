import 'package:flutter/material.dart';
import 'package:offic3/constants_globals.dart';
import 'package:offic3/screens/client_screen.dart';

class ClientOverviewCard extends StatelessWidget {
  const ClientOverviewCard({Key? key, required this.clientNameInput, required this.index2})
      : super(key: key);

  final String clientNameInput;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientScreen(
              index3: index2,
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
        width: double.infinity,
        alignment: Alignment.center,
        padding: kStandardPadding,
        child: Text(
          clientNameInput,
          style: kLabelTextStyle,
        ),
      ),
    );
  }
}