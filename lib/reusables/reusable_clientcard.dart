import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';
import 'package:offic3/providers/productinfo_provider.dart';
import 'package:provider/provider.dart';

class ReusableClientCard extends StatefulWidget {
  ReusableClientCard({
    Key? key,
    required this.productname,
    required this.delete,
    required this.indexCC,
    //indexCS == indexCC2
    required this.indexCC2,
  }) : super(key: key);

  //this index points out the position of the reusable_client_card's at client_screen gridview.
  int indexCC;
  //this index makes us understand which client's product it is. indexCS == indexCC2
  final int indexCC2;
  final String productname;
  final void Function(int) delete;

  @override
  State<ReusableClientCard> createState() => _ReusableClientCardState();
}

class _ReusableClientCardState extends State<ReusableClientCard> {
  @override
  Widget build(BuildContext context) {
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
              "${widget.productname} - ${context.read<ProductInfoProvider>().productPriceGetter(widget.indexCC2, widget.indexCC)}\$",
              style: kStandardTextStyle3,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "Count: ${context.watch<ProductInfoProvider>().productCountGetter(widget.indexCC2, widget.indexCC)}",
            style: kStandardTextStyle4,
          ),
          const SizedBox(height: 7),
          Text(
            "Total Price: ${context.watch<ProductInfoProvider>().productCountGetter(widget.indexCC2, widget.indexCC) * context.read<ProductInfoProvider>().productPriceGetter(widget.indexCC2, widget.indexCC)}\$",
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
                  onPressed: () => context
                      .read<ProductInfoProvider>()
                      .incrementCount(widget.indexCC2, widget.indexCC),
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
                  onPressed: () => context
                      .read<ProductInfoProvider>()
                      .decrementCount(widget.indexCC2, widget.indexCC),
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
                    context
                        .read<ProductInfoProvider>()
                        .removeProduct(widget.indexCC2, widget.indexCC);
                    widget.delete(widget.indexCC);
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
