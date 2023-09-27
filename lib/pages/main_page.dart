import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/pages/home_page.dart';
import 'package:flutter_ui_widgets/pages/inbox_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const InboxPage(),
  ];

  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo_dark.png',
          width: 180,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [..._pages],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Clicked');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Index')
        ],
      ),
    );
  }
}
