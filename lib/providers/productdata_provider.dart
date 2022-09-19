
import 'package:flutter/material.dart';
import 'package:offic3/hive/hive_client_screen.dart';

class ProductDataProvider with ChangeNotifier {

  List<List<dynamic>> productCounts = [];
  List<List<dynamic>> productPrices = [];
  List<List<String>> productNames = [];


  //______________ methods for creating and loading client screen.
  //
  // ID explanation: id is the combination of indexCLS and indexCS;for example lets say that indexCLS is "0" and indexCS is "5" than id is "05" as String.
  void createClientScreen(String id) {
    productCounts.add([id]);
    productPrices.add([id]);
    productNames.add([id]);
    addIdDataForClientScreen(id);
  }
  void loadClientScreen(String id) {
    productCounts.add([id]);
    productPrices.add([id]);
    productNames.add([id]);
  }


  //______________ product adding method and product loading methods.
  void addProduct(int indexCLS, int indexCS, int price, int count, String name) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productCounts[wantedlistCounts].add(count);
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productPrices[wantedlistPrices].add(price);
    final wantedlistNames = productNames.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productNames[wantedlistNames].add(name);
    addProductPriceDataForClientScreen(price, indexCLS.toString() + indexCS.toString());
    addProductCountDataForClientScreen(count, indexCLS.toString() + indexCS.toString());
    addProductNameDataForClientScreen(name, indexCLS.toString() + indexCS.toString());
  }
  void loadProduct(int indexCLS, int indexCS, int price, int count, String name) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productCounts[wantedlistCounts].add(count);
    // print('$productCounts provider counts');
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productPrices[wantedlistPrices].add(price);
    // print('$productPrices provider prices');
    final wantedlistNames = productNames.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productNames[wantedlistNames].add(name);
    // print('$productNames provider names');
  }


  //______________ price, count and name getters.
  int productPriceGetter(int indexCLS, int indexCS, int indexPC) {
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    return productPrices[wantedlistPrices][indexPC+1];
  }
  int productCountGetter(int indexCLS, int indexCS, int indexPC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    return productCounts[wantedlistCounts][indexPC+1];
  }
  List<dynamic> productInfoGetter(String id) {
    final priceInfoList = productPrices.indexWhere((element) => element[0] == id);
    return productPrices[priceInfoList];
  }


  //______________ count increase and decrease methods.
  void incrementCount(int indexCLS, int indexCS, int indexPC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productCounts[wantedlistCounts][indexPC+1]++;
    notifyListeners();
    incrementProductCountDataForClientScreen(indexCLS.toString() + indexCS.toString(), indexPC);
  }

  void decrementCount(int indexCLS, int indexCS, int indexPC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    if(productCounts[wantedlistCounts][indexPC+1] != 0) {
      productCounts[wantedlistCounts][indexPC+1]--;
      notifyListeners();
      decrementProductCountDataForClientScreen(indexCLS.toString() + indexCS.toString(), indexPC);
    }
  }


  //______________ product removing method.
  void removeProduct(int indexCLS, int indexCS, int indexPC) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productCounts[wantedlistCounts].removeAt(indexPC+1);
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productPrices[wantedlistPrices].removeAt(indexPC+1);
    final wantedlistNames = productNames.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    productNames[wantedlistNames].removeAt(indexPC+1);
    notifyListeners();
    removeProductDataForClientScreen(indexCLS.toString() + indexCS.toString(), indexPC);
  }


  List<dynamic> productPriceListGetter(int indexCLS, int indexCS) {
    final wantedlistPrices = productPrices.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    List<dynamic> priceList = productPrices[wantedlistPrices];

    return priceList;
  }
  List<dynamic> productCountListGetter(int indexCLS, int indexCS) {
    final wantedlistCounts = productCounts.indexWhere((element) => element[0] == indexCLS.toString() + indexCS.toString());
    List<dynamic> countList = productCounts[wantedlistCounts];

    return countList;
  }

}
