import 'package:crud/controllers/item_controller.dart';
import 'package:crud/controllers/theme_controller.dart';
import 'package:crud/ui/addeditscreen.dart';
import 'package:crud/utils/app_colors.dart';
import 'package:crud/utils/tickbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeController = Get.put(ThemeController());
    final ItemController itemController = Get.put(ItemController());
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  'Switch Mode',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(width: 10),
                Obx(() {
                  return Switch(
                    value: themeController.isDark.value,
                    onChanged: (val) => themeController.toggleTheme(val),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taskly', style: Theme.of(context).textTheme.displayLarge),
                Text(
                  '(Slide to Delete)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 20),

            Obx(() {
              if (itemController.items.isEmpty) {
                return Center(child: Text('No items yet'));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: itemController.items.length,
                  itemBuilder: (context, index) {
                    final item = itemController.items[index];

                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) => itemController.deleteItem(index),
                      background: Container(color: Colors.red),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            if (theme.brightness == Brightness.light)
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${index + 1}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  item.title.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duration',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  item.duration,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            TickBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primaryColor,
        onPressed: () => Get.to(() => Addeditscreen(isEditing: false)),

        icon: Icon(Icons.add, color: AppColors.white),
        label: Text('Add Task', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
