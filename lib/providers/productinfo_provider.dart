import 'package:flutter/material.dart';

class ProductInfoProvider with ChangeNotifier {

  List<List<int>> productCounts = [];
  List<List<int>> productPrices = [];

  void createClientScreen(int indexCS) {
    productCounts.add([indexCS]);
    productPrices.add([indexCS]);
  }

  void addProduct(int indexCS, int price){
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCS);
    productCounts[wantedlistCounts].add(0);

    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCS);
    productPrices[wantedlistPrices].add(price);
  }

  int productPriceGetter(int indexCS, int indexCC) {
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCS);
    return productPrices[wantedlistPrices][indexCC+1];
  }

  int productCountGetter(int indexCS, int indexCC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCS);
    return productCounts[wantedlistCounts][indexCC+1];
  }

  void incrementCount(int indexCS, int indexCC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCS);
    productCounts[wantedlistCounts][indexCC+1]++;
    notifyListeners();
  }

  void decrementCount(int indexCS, int indexCC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCS);
    if(productCounts[wantedlistCounts][indexCC+1] != 0) {
      productCounts[wantedlistCounts][indexCC+1]--;
      notifyListeners();
    }
  }

  void removeProduct(int indexCS, int indexCC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCS);
    productCounts[wantedlistCounts].removeAt(indexCC+1);
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCS);
    productPrices[wantedlistPrices].removeAt(indexCC+1);
  }
}
