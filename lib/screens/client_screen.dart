
import 'package:flutter/material.dart';
import 'package:offic3/constants_globals.dart';
import 'package:offic3/reusables/reusable_clientoverviewcard.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen(
      {Key? key, required this.index3, required this.clientName})
      : super(key: key);

  final int index3;
  final String clientName;

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<ClientScreen> {
  late String futureSoldProducts;
  List<ClientOverviewCard> soldProductsOverviewList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton.extended(
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
                    futureSoldProducts = value;
                    soldProductsOverviewList.add(
                      ClientOverviewCard(
                        clientNameInput: futureSoldProducts,
                        index2: soldProductsOverviewList.length,
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
      ),*/
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
                    'Client: ${widget.clientName}',
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
                    'Client\'s Total Bill: -',
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
                children: soldProductsOverviewList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}