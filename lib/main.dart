import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliverappbar/home_screen.dart';

import 'utils/my_theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return  MaterialApp(
      title: 'NSliverAppBar',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        primaryColor: MyTheme.themeColor,
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.grey),
        primaryIconTheme: IconThemeData(color: MyTheme.themeColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: const HomeScreen(),
      //home: Main(),
    );
  }
}