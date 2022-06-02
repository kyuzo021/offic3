import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offic3/consts,%20globals/constants_globals.dart';

class ReusableClientCard extends StatefulWidget {
  ReusableClientCard(
      {Key? key,
      required this.productname,
      required this.unitprice,
      required this.indexForclientcard,
      required this.delete,
      required this.totalpricefunc})
      : super(key: key);

  final void Function(double) totalpricefunc;
  final String productname;
  final double unitprice;
  int indexForclientcard;
  final void Function(int) delete;

  @override
  State<ReusableClientCard> createState() => _ReusableClientCardState();
}

class _ReusableClientCardState extends State<ReusableClientCard> {
  int productcount = 0;

  double totalPriceCalculator() {
    return productcount * widget.unitprice;
  }

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
              "${widget.productname} - ${widget.unitprice}\$",
              style: kStandardTextStyle3,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "Count: $productcount",
            style: kStandardTextStyle4,
          ),
          const SizedBox(height: 7),
          Text(
            "Total Price: ${totalPriceCalculator().toStringAsFixed(2)}\$",
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
                    setState(() {
                      productcount += 1;
                      widget.totalpricefunc(widget.unitprice);
                    });
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
                    setState(() {
                      if(productcount != 0){
                        widget.totalpricefunc(-widget.unitprice);
                      }
                      productcount == 0 ? productcount -= 0 : productcount -= 1;
                    });
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
                      widget.totalpricefunc(-(productcount * widget.unitprice));
                      widget.delete(widget.indexForclientcard);
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