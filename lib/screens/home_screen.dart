import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedPage = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    const Scaffold(
      body: Center(
        child: Text('En vivo'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          'Centro Misionero\nPentecostés',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      allowedViews: const [CalendarView.day, CalendarView.month],
      firstDayOfWeek: 7,
      initialDisplayDate: DateTime.now(),
      showCurrentTimeIndicator: true,
      showWeekNumber: true,
    ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('CMP'),
        ),
        body: Center(child: _pages.elementAt(_selectedPage)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.stream), label: 'En vivo'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Actividades'),
          ],
          currentIndex: _selectedPage,
          onTap: _onItemTapped,
        ));
  }
}
