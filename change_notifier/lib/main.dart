import 'package:change_notifier/presentation/controllers/theme_controller.dart';
import 'package:change_notifier/presentation/pages/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeController,
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: value ? ThemeData.dark() : ThemeData.light(),
            home: const MyHomePage(),
          );
        });
  }
}
