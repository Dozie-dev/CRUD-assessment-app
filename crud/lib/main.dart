import 'package:crud/controllers/theme_controller.dart';
import 'package:crud/models/item_model.dart';
import 'package:crud/ui/splashscreen.dart';
import 'package:crud/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<ItemModel>('items');

  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeController.isDark.value
          ? ThemeMode.dark
          : ThemeMode.light,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
