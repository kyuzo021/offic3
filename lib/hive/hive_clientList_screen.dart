
import 'package:hive_flutter/hive_flutter.dart';

void addDataForClientListScreen(int x, String y, String z) async{
  final clientListData = Hive.box('clientList_screen_$z');
  await clientListData.put(x, y);
}

Future<Iterable> dataRetrieverForClientListScreen(String clientListScreenIndex) async{
  final clientListData = Hive.box('clientList_screen_$clientListScreenIndex');
  return clientListData.values;
}