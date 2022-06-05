import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/reusables/reusable_clientcard.dart';
import 'package:provider/provider.dart';
import 'package:offic3/providers/productinfo_provider.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key? key, required this.indexCS, required this.clientName})
      : super(key: key);
  //index for client screen.
  final int indexCS;
  final String clientName;

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<ClientScreen> {
  //variable for is bill paid button.
  late bool isBillPaid = false;
  List<ReusableClientCard> productList = [];

  //variables for floating action button.
  late String productName;
  late String productPrice;

  // method for reusable_clientcard's delete button to work.
  void deleteReusable(final int index) {
    if (productList.isNotEmpty) {
      productList.removeAt(index);
      for (int i = index; i < productList.length; i++) {
        productList[i].indexCC = productList[i].indexCC - 1;
      }
      setState(() {});
    }
  }

  //This adds tea and water automatically when the screen gets created.
  @override
  void initState() {
    context.read<ProductInfoProvider>().createClientScreen(widget.indexCS);
    productList.add(
      ReusableClientCard(
        productname: "TEA",
        delete: deleteReusable,
        indexCC: productList.length,
        indexCC2: widget.indexCS,
      ),
    );
    context.read<ProductInfoProvider>().addProduct(widget.indexCS, 2);

    productList.add(
      ReusableClientCard(
        productname: "WATER",
        delete: deleteReusable,
        indexCC: productList.length,
        indexCC2: widget.indexCS,
      ),
    );
    context.read<ProductInfoProvider>().addProduct(widget.indexCS, 1);
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
                    onChanged: (String value) {
                      setState(
                        () {
                          productName = value;
                        },
                      );
                    },
                    decoration:
                        const InputDecoration(labelText: 'Product\'s name.'),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(
                        () {
                          productPrice = value;
                        },
                      );
                    },
                    decoration:
                        const InputDecoration(labelText: 'Product\'s price.'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        productList.add(
                          ReusableClientCard(
                            productname: productName,
                            delete: deleteReusable,
                            indexCC: productList.length,
                            indexCC2: widget.indexCS,
                          ),
                        );
                        context.read<ProductInfoProvider>().addProduct(widget.indexCS, int.parse(productPrice));
                      },
                    );
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
                children: [...productList],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
