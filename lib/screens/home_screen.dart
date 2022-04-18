import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cmp_app/screens/calendar_screen.dart';
import 'package:cmp_app/screens/home_tab_screen.dart';
import 'package:cmp_app/screens/streaming_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  BottomNavyBarItem _createBottomNavyBarItem(String title, Icon icon) {
    return BottomNavyBarItem(
        icon: icon, title: Text(title, style: const TextStyle(fontSize: 11)));
  }

  static const List<Widget> _pages = <Widget>[
    Scaffold(
      body: StreamingScreen(),
    ),
    Scaffold(
      body: HomeTabScreen(),
    ),
    Scaffold(
      body: CalendarScreen(),
    ),
    Scaffold(
      body: Center(
        child: Text('Iniciar sesión'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CMP'),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [_pages.elementAt(_currentIndex)],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: _onItemSelected,
        items: [
          _createBottomNavyBarItem('En vivo', const Icon(Icons.stream)),
          _createBottomNavyBarItem('Inicio', const Icon(Icons.home)),
          _createBottomNavyBarItem(
              'Actividades', const Icon(Icons.calendar_month)),
          _createBottomNavyBarItem('Iniciar Sesión', const Icon(Icons.people))
        ],
      ),
    );
  }
}
