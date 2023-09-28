import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/pages/create_article_page.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Index')
          ],
        ),
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: IndexedStack(
            key: ValueKey<int>(_selectedIndex),
            index: _selectedIndex,
            children: [..._pages],
          ),
        ),
        floatingActionButton: OpenContainer(
            closedColor: Theme.of(context).primaryColor,
            closedShape: const CircleBorder(),
            closedElevation: 6,
            closedBuilder: (context, _) {
              return FloatingActionButton(
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: null,
                child: const Icon(Icons.add),
              );
            },
            openBuilder: (context, _) {
              return const CreateArticlePage();
            })
        //  FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const CreateArticlePage(),
        //       ),
        //     );
        //   },
        //   child: const Icon(Icons.add),
        // ),
        );
  }
}
