import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class testOng extends StatefulWidget {
  const testOng({Key? key}) : super(key: key);

  @override
  State<testOng> createState() => _testOngState();
}

class _testOngState extends State<testOng> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvents;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          location: "Bangkok",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Test 1',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvents = events[selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    selectedEvents = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test calendar"),
      ),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.purple,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w100),
          bottomBarTextStyle: TextStyle(
            color: Colors.black12,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        ),
      ),
    );
  }
}
