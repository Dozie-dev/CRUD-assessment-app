import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String duration;

  ItemModel({required this.title, required this.duration});
}
