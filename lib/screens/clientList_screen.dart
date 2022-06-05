import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/reusables/reusable_clientlistcard.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kColor3,
        label: const Text(
          'Add a Client',
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
                      ),
                    );
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date: ${widget.dateForClientScreen}',
                    style: kLabelTextStyle2,
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
              child: ListView(
                children: clientOverviewList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}