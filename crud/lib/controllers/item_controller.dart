import 'package:crud/models/hive_boxes.dart';
import 'package:crud/models/item_model.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  var items = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeItems();
  }

  void _initializeItems() {
    final box = HiveBoxes.getItemsBox();

    //-- Add default items if box is empty
    if (box.isEmpty) {
      box.add(ItemModel(title: 'Sample Task 1', duration: '1 Month'));
      box.add(ItemModel(title: 'Sample Task 2',  duration: '2 Weeks'));
      box.add(ItemModel(title: 'Sample Task 3',  duration: '5 Months'));
    }
    items.assignAll(box.values.toList());
  }

  void addItem(String title, String duration) async {
    final box = HiveBoxes.getItemsBox();
    final newItem = ItemModel(title: title, duration: duration);
    await box.add(newItem);
    items.add(newItem); 
  }

  void updateItem(int index, String newTitle, String duration) async {
    final box = HiveBoxes.getItemsBox();
    final key = box.keyAt(index);
    final updatedItem = ItemModel(title: newTitle, duration: duration);
    await box.put(key, updatedItem);
    items[index] = updatedItem; 
  }

  void deleteItem(int index) async {
    final box = HiveBoxes.getItemsBox();
    final key = box.keyAt(index);
    await box.delete(key);
    items.removeAt(index); 
  }
}
