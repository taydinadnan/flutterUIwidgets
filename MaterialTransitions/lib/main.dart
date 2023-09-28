import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

final lightTheme = ThemeData(
    textTheme: const TextTheme(
  headlineSmall: TextStyle(fontSize: 18),
));

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 24),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Widgets',
      theme: lightTheme.copyWith(
        colorScheme: lightTheme.colorScheme.copyWith(
          primary: Colors.red,
          secondary: Colors.green,
        ),
      ),
      darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      home: MainPage(),
    );
  }
}
