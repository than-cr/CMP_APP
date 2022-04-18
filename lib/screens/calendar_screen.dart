import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarScreen();
}

class _CalendarScreen extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      allowedViews: const [CalendarView.day, CalendarView.month],
      firstDayOfWeek: 7,
      initialDisplayDate: DateTime.now(),
      showCurrentTimeIndicator: true,
    );
  }
}
