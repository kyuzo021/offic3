
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/reusables/reusable_productcard.dart';
import 'package:provider/provider.dart';
import 'package:offic3/providers/productdata_provider.dart';
import 'package:offic3/hive/hive_client_screen.dart';
import 'package:offic3/providers/totalprice_provider.dart';
// import 'package:hive/hive.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key, required this.indexCS, required this.clientName, required this.indexCLS})
      : super(key: key);
  //index for client screen.
  final int indexCS;
  final int indexCLS;
  final String clientName;

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<ClientScreen> {

  List<ReusableProductCard> productList = [];

  //variables for floating action button.
  late String productName;
  late String productPrice;

  // method for reusable_productcard's delete button to work.
  void deleteReusable(final int index) {
    if (productList.isNotEmpty) {
      productList.removeAt(index);
      for (int i = index; i < productList.length; i++) {
        productList[i].indexPC = productList[i].indexPC - 1;
      }
      setState(() {});
    }
  }

  // This adds tea and water automatically when the screen gets created.
  @override
  void initState() {
    super.initState();
    initiatorForClientScreen();
  }

  void initiatorForClientScreen() async{
    Iterable idDataForClientScreen = await retrieveIdDataForClientScreen();
    List valuesList = idDataForClientScreen.toList();
    bool result = valuesList.any((element) => element == widget.indexCLS.toString() + widget.indexCS.toString());
    if(result == false) {
      context.read<ProductDataProvider>().createClientScreen(widget.indexCLS.toString() + widget.indexCS.toString());
    }
    Iterable priceDataForClientScreen = await retrieveProductPriceDataForClientScreen(widget.indexCLS.toString() + widget.indexCS.toString());
    Iterable countDataForClientScreen = await retrieveProductCountDataForClientScreen(widget.indexCLS.toString() + widget.indexCS.toString());
    Iterable nameDataForClientScreen = await retrieveProductNameDataForClientScreen(widget.indexCLS.toString() + widget.indexCS.toString());
    List<dynamic> productInfo = context.read<ProductDataProvider>().productInfoGetter(widget.indexCLS.toString() + widget.indexCS.toString());
    for(int i = 0; i < priceDataForClientScreen.length; i++){
      if(productInfo.length != priceDataForClientScreen.length+1) {
        context.read<ProductDataProvider>().loadProduct(widget.indexCLS, widget.indexCS, priceDataForClientScreen.elementAt(i), countDataForClientScreen.elementAt(i), nameDataForClientScreen.elementAt(i));
      }
      productList.add(ReusableProductCard(productname: nameDataForClientScreen.elementAt(i), delete: deleteReusable, indexPC: productList.length, indexCS: widget.indexCS, indexCLS: widget.indexCLS));
    }

    List<dynamic> priceList = context.read<ProductDataProvider>().productPriceListGetter(widget.indexCLS, widget.indexCS);
    List<dynamic> countList = context.read<ProductDataProvider>().productCountListGetter(widget.indexCLS, widget.indexCS);
    context.read<TotalPriceProvider>().totalPriceCalculator(priceList, countList, widget.indexCLS, widget.indexCS);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    int totalPrice = context.read<TotalPriceProvider>().totalPriceGetter(widget.indexCLS, widget.indexCS);

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton.extended(
              heroTag: 'btn1',
              backgroundColor: kColor3,
              splashColor: Colors.black54,
              label: const Icon(
                CupertinoIcons.cart_fill_badge_plus,
                color: kColor4,
                size: 30,
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
                                ReusableProductCard(
                                  productname: productName,
                                  delete: deleteReusable,
                                  indexPC: productList.length,
                                  indexCS: widget.indexCS,
                                  indexCLS: widget.indexCLS,
                                ),
                              );
                              context.read<ProductDataProvider>().addProduct(widget.indexCLS, widget.indexCS, int.parse(productPrice), 0, productName);
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
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton.extended(
              heroTag: 'btn2',
              label: const Icon(CupertinoIcons.doc_checkmark_fill, color: kColor4, size: 30),
              backgroundColor: Colors.teal,
              splashColor: Colors.black54,
              onPressed: () async{
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Total Price is: $totalPrice\$', style: kStandardTextStyle3XX),
                        children: const [
                          SimpleDialogOption(
                            child: Text('Checked out.', style: kStandardTextStyle3X),
                            onPressed: null,
                          ),
                          SimpleDialogOption(
                            child: Text('Cancel'),
                            onPressed: null,
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.person_crop_rectangle, color: kColor4,),
                      const SizedBox(width: 10),
                      Text(
                        widget.clientName,
                        style: kLabelTextStyle2,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kColor4,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Overview', style: kStandardTextStyle2),
                      Text('TOTAL: $totalPrice\$', style: kStandardTextStyle3X,),
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
