
// import 'package:hive/hive.dart';
import 'package:offic3/reusables/reusable_datelistcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/hive/hive_dayList_screen.dart';


class DateListScreen extends StatefulWidget {
  const DateListScreen({Key? key}) : super(key: key);

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<DateListScreen> {
  late String futureDate;
  List<ReusableDateListCard> dayPageList = [];

  @override
  void initState() {
    super.initState();
    initiateForDayListScreen();
  }

  void initiateForDayListScreen() async {
    Iterable valuesForDayListScreen = await dataRetrieverForDayListScreen();
    for (String x in valuesForDayListScreen) {
      dayPageList.add(ReusableDateListCard(
          dateInput: x.toString(), indexRDLC: dayPageList.length));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton.extended(
          backgroundColor: kColor3,
          label: const Icon(
            CupertinoIcons.calendar_badge_plus,
            color: kColor4,
            size: 30,
          ),
          onPressed: () async {
            // await Hive.box('dayList_screen').deleteFromDisk();
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
                        ReusableDateListCard(
                          dateInput: futureDate,
                          indexRDLC: dayPageList.length,
                        ),
                      );
                      addDataForDayListScreen(dayPageList.length, futureDate);
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.calendar_circle_fill),
                      SizedBox(width: 10),
                      Text(
                        'Date Screen',
                        style: kLabelTextStyle2,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kColor4,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Expanded(
                child:ListView.builder(
                  itemCount: dayPageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return dayPageList[index];
                  },
                ),
            ),
          ],
        ),
      )
    );
  }
}


