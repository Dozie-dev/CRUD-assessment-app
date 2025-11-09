import 'package:crud/models/item_model.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static Box<ItemModel> getItemsBox() => Hive.box<ItemModel>('items');
}
