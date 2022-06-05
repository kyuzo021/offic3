import 'package:offic3/reusables/reusable_daylistcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';

class DayListScreen extends StatefulWidget {
  const DayListScreen({Key? key}) : super(key: key);

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<DayListScreen> {

  late String futureDate;
  List<ReusableDayListCard> dayPageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor1,
        title: const Text(
          'Day Screen',
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
              title: const Text('Write a date of the day.'),
              content: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (String value) {
                  setState(() {
                    futureDate = value;
                    dayPageList.add(
                      ReusableDayListCard(
                        dateInput: futureDate,
                        indexRDLC: dayPageList.length,
                      ),
                    );
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'Example: 13.12.1996'),
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
      body: ListView(
        children: dayPageList,
      ),
    );
  }
}
