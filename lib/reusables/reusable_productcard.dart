import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/providers/productdata_provider.dart';
import 'package:provider/provider.dart';

class ReusableProductCard extends StatefulWidget {
  ReusableProductCard({
    Key? key,
    required this.productname,
    required this.delete,
    required this.indexPC,
    required this.indexCS,
    required this.indexCLS,
  }) : super(key: key);

  //this index points out the position of the reusable_productcard at client_screen gridview.
  int indexPC;
  //this index makes us understand which client's product it is.
  final int indexCS;
  final int indexCLS;
  final String productname;
  final void Function(int) delete;

  @override
  State<ReusableProductCard> createState() => _ReusableProductCardState();
}

class _ReusableProductCardState extends State<ReusableProductCard> {
  @override
  Widget build(BuildContext context) {

    int totalPrice = context.watch<ProductDataProvider>().productCountGetter(widget.indexCLS, widget.indexCS, widget.indexPC) * context.watch<ProductDataProvider>().productPriceGetter(widget.indexCLS, widget.indexCS, widget.indexPC);


    return Container(
      margin: const EdgeInsetsDirectional.all(6),
      padding: const EdgeInsetsDirectional.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: kColor2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: kColor1, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsetsDirectional.all(5),
            child: Text(
              "${widget.productname} - ${context.watch<ProductDataProvider>().productPriceGetter(widget.indexCLS, widget.indexCS, widget.indexPC)}\$",
              style: kStandardTextStyle3,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "Count: ${context.watch<ProductDataProvider>().productCountGetter(widget.indexCLS, widget.indexCS, widget.indexPC)}",
            style: kStandardTextStyle4,
          ),
          const SizedBox(height: 7),
          Text(
            "Total Price: $totalPrice\$",
            style: kStandardTextStyle4,
          ),
          const SizedBox(height: 5),
          const Divider(
            thickness: 1,
            color: kColor1,
            endIndent: 17,
            indent: 17,
          ),
          Expanded(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    context
                      .read<ProductDataProvider>().incrementCount(widget.indexCLS, widget.indexCS, widget.indexPC);
                  },
                  child: const Icon(
                    CupertinoIcons.add_circled_solid,
                    color: kColor4,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kColor1,
                    shape: const CircleBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context
                      .read<ProductDataProvider>()
                      .decrementCount(widget.indexCLS, widget.indexCS, widget.indexPC);
                  },
                  child: const Icon(
                    CupertinoIcons.minus_circle,
                    color: kColor4,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kColor1,
                    shape: const CircleBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ProductDataProvider>().removeProduct(widget.indexCLS, widget.indexCS, widget.indexPC);
                    widget.delete(widget.indexPC);
                  },
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: kColor4,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kColor1,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
