
import 'package:offic3/reusables/reusable_datecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/constants_globalmethods.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<DayPage> {
  late String futureDate = '00.00.0000';

  List <ReusableCard1> datePageList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor1,
        title: const Text(
          'Date Screen',
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kColor3,
        label: const Text(
          'Add a day',
          style: kStandardTextStyle,
        ),
        icon: const Icon(
          CupertinoIcons.plus,
          color: kColor4,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: kColor1,
              title: const Text('Write a date.'),
              content: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (String value) {
                  setState(() {
                    futureDate = value;
                    datePageList.add(ReusableCard1(datetxt: futureDate));
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Example: 13.12.1996'
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );
        },
      ),
      body: Column(
        children: datePageList,
      ),
    );
  }
}
