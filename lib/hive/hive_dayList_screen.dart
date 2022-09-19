
import 'package:hive_flutter/hive_flutter.dart';

void addDataForDayListScreen(int x, String y) async{
  final dayListData = Hive.box('dayList_screen');
  await dayListData.put(x, y);
}

Future<Iterable> dataRetrieverForDayListScreen() async{
  final dayListData2 = Hive.box('dayList_screen');
  return dayListData2.values;
}