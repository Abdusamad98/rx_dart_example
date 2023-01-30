import 'package:flutter/material.dart';
import 'package:rx_dart_example/counter_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
     // themeMode: ThemeMode.,
      home: CounterPage(),
    );
  }
}

class AppTheme{
  static ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black
  );

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white
  );
}
