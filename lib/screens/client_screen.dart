import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/reusables/reusable_clientcard.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key, required this.index3, required this.clientName})
      : super(key: key);

  final int index3;
  final String clientName;

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<ClientScreen> {
  //variable for is bill paid button.
  late bool isBillPaid = false;
  List<ReusableClientCard> clientList = [];

  //variables for floating action button.
  late String productName;
  late String productPrice;

  //method for clientcard's delete button to work.
  void deleteReusable(final int index) {
    if (clientList.isNotEmpty) {
      clientList.removeAt(index);
      for (int i = index; i < clientList.length; i++) {
        clientList[i].indexForclientcard = clientList[i].indexForclientcard - 1;
      }
      setState(() {});
      print(clientList.length);
    }
  }

  //This adds tea and water automatically when the screen gets created.
  void initState() {
    clientList.add(ReusableClientCard(
        productname: "TEA",
        unitprice: 2,
        indexForclientcard: clientList.length,
        delete: deleteReusable));
    clientList.add(ReusableClientCard(
        productname: "Water",
        unitprice: 1,
        indexForclientcard: clientList.length,
        delete: deleteReusable));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kColor3,
        label: const Text(
          'Add a Product',
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
              title: const Text('Write the name of the product and the price.'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    onSubmitted: (String value) {
                      setState(() {
                        productName = value;
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: 'Product\'s name.'),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onSubmitted: (String value) {
                      setState(() {
                        productPrice = value;
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: 'Product\'s price.'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      clientList.add(
                        ReusableClientCard(
                          productname: productName,
                          unitprice: int.parse(productPrice),
                          indexForclientcard: clientList.length,
                          delete: deleteReusable,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                ),
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
                    'Client: ${widget.clientName}',
                    style: kLabelTextStyle2,
                  ),
                  const SizedBox(height: 1),
                  const Text('Overview', style: kStandardTextStyle2),
                  const SizedBox(height: 3),
                  const Text(
                    'Client\'s Total Check: -',
                    style: kStandardTextStyle2,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Text(
                        "Is Bill paid?:",
                        style: kStandardTextStyle3,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isBillPaid == false
                                ? isBillPaid = true
                                : isBillPaid = false;
                          });
                        },
                        child: Text(
                          isBillPaid == false ? "No" : "Yes",
                          style: const TextStyle(
                            fontFamily: 'SourceCodePro',
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: kColor3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "(Click to Change.)",
                        style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          fontSize: 13,
                          color: kColor4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [...clientList],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
