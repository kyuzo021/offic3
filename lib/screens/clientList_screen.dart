
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/reusables/reusable_clientlistcard.dart';
import 'package:offic3/hive/hive_clientList_screen.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen(
      {Key? key, required this.indexCLS, required this.dateForClientScreen})
      : super(key: key);

  //index of the client list screen.
  final int indexCLS;
  final String dateForClientScreen;

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<ClientListScreen> {
  late String futureClient;
  List<ReusableClientListCard> clientOverviewList = [];

  @override
  void initState() {
    super.initState();
    initiateForClientListScreen();
  }

  void initiateForClientListScreen() async {
    Iterable valuesForClientListScreen =
        await dataRetrieverForClientListScreen(widget.indexCLS.toString());
    for (String x in valuesForClientListScreen) {
      clientOverviewList.add(
        ReusableClientListCard(
          clientNameInput: x.toString(),
          indexRCLC: clientOverviewList.length,
          indexCLS: widget.indexCLS,
        ),
      );
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
            CupertinoIcons.person_add_solid,
            color: kColor4,
            size: 30,
          ),
          onPressed: () async{
            // await Hive.box('clientList_screen_0').deleteFromDisk();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: kColor1,
                title: const Text('Write client\'s name.'),
                content: TextField(
                  keyboardType: TextInputType.text,
                  onSubmitted: (String value) {
                    setState(() {
                      futureClient = value;
                      clientOverviewList.add(
                        ReusableClientListCard(
                          clientNameInput: futureClient,
                          indexRCLC: clientOverviewList.length,
                          indexCLS: widget.indexCLS,
                        ),
                      );
                      addDataForClientListScreen(clientOverviewList.length, value,
                          widget.indexCLS.toString());
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Example: Tom'),
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
                    children: [
                      const Icon(CupertinoIcons.calendar_today),
                      const SizedBox(width: 10),
                      Text(
                        widget.dateForClientScreen,
                        style: kLabelTextStyle2,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kColor4,
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontFamily: 'SourceCodePro',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kColor4,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Day\'s Total Turnover: -',
                    style: TextStyle(
                      fontFamily: 'SourceCodePro',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kColor4,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: clientOverviewList.length,
                itemBuilder: (BuildContext context, int index) {
                  return clientOverviewList[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
