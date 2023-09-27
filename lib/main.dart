import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter UI Widgets',
      home: MainPage(),
    );
  }
}
