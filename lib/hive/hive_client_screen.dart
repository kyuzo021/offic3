
import 'package:hive_flutter/hive_flutter.dart';

//_____________________ methods for adding id to hive data base and retrieving it.
void addIdDataForClientScreen(String x) async{
  final clientData = Hive.box('clientScreen_id');
  await clientData.add(x);
}

Future<Iterable> retrieveIdDataForClientScreen() async{
  final clientData = Hive.box('clientScreen_id');
  return clientData.values;
}

//_____________________ add product price and retrieve product price methods.
void addProductPriceDataForClientScreen(int x, String y) async{
  final clientData = Hive.box('productPrices_$y');
  await clientData.add(x);
}
Future<Iterable> retrieveProductPriceDataForClientScreen(String x) async{
  final clientData = Hive.box('productPrices_$x');
  return clientData.values;
}

//_____________________ add product count and retrieve product count methods.
void addProductCountDataForClientScreen(int x, String y) async{
  final clientData = Hive.box('productCounts_$y');
  await clientData.add(x);
}
Future<Iterable> retrieveProductCountDataForClientScreen(String x) async{
  final clientData = Hive.box('productCounts_$x');
  return clientData.values;
}

//_____________________ add product name and retrieve product name methods.
void addProductNameDataForClientScreen(String x, String y) async{
  final clientData = Hive.box('productNames_$y');
  await clientData.add(x);
}
Future<Iterable> retrieveProductNameDataForClientScreen(String x) async{
  final clientData = Hive.box('productNames_$x');
  return clientData.values;
}

//_____________________ increment the product count methods
void incrementProductCountDataForClientScreen(String x , int y) {
  final clientData = Hive.box('productCounts_$x');
  int a = clientData.getAt(y);
  clientData.putAt(y, a+1);
}

//_____________________ decrement the product count method.
void decrementProductCountDataForClientScreen(String x, int y) {
  final clientData = Hive.box('productCounts_$x');
  int a = clientData.getAt(y);
  clientData.putAt(y, a-1);
}

//_____________________ remove the product method.
void removeProductDataForClientScreen(String x, int y) {
  final productPriceData = Hive.box('productPrices_$x');
  final productCountData = Hive.box('productCounts_$x');
  final productNameData = Hive.box('productNames_$x');
  productPriceData.deleteAt(y);
  productCountData.deleteAt(y);
  productNameData.deleteAt(y);
}
