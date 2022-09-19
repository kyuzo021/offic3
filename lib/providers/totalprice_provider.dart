
import 'package:flutter/material.dart';


class TotalPriceProvider with ChangeNotifier {

  List<List<dynamic>> totalPrices = [];


  //______________ this method calculates the total price of the client screen than adds it to the totalPrices List.
  void totalPriceCalculator(List<dynamic> priceList, List<dynamic> countList, int indexCLS, int indexCS) {

    totalPrices.add([indexCLS.toString() + indexCS.toString()]);

    List<int> priceListForCalculator = [];
    List<int> countListForCalculator = [];
    List<int> pricesOfProductsMultipliedByCountsList = [];

    for(int i = 1; i < priceList.length; i++) {
      priceListForCalculator.add(priceList[i]);
    }
    for(int i = 1; i < countList.length; i++) {
      countListForCalculator.add(countList[i]);
    }

    for(int i = 0; i < priceListForCalculator.length; i++) {
      int a = priceListForCalculator[i]*countListForCalculator[i];
      pricesOfProductsMultipliedByCountsList.add(a);
    }

    int totalPrice = pricesOfProductsMultipliedByCountsList.fold(0, (p, c) => p + c);

    print(totalPrice);

    final wantedListFromTotalPrices = totalPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    totalPrices[wantedListFromTotalPrices].add(totalPrice);
  }

  int totalPriceGetter(int indexCLS, int indexCS) {
    final wantedListFromTotalPrices = totalPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    return totalPrices[wantedListFromTotalPrices][1];
  }

}