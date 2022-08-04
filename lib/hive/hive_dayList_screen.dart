
import 'package:hive_flutter/hive_flutter.dart';

void addData(int _x, String _y) async{
  final dayListData = Hive.box('dayList_screen');
  await dayListData.put(_x, _y);
}

dataLengthRetriever() async{
  final dayListData2 = Hive.box('dayList_screen');
  return dayListData2.values.length;
}

Future<Iterable> dataRetriever() async{
  final dayListData2 = Hive.box('dayList_screen');
  return dayListData2.values;
}