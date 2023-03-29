import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:gogotrip/constants/styles.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvents;

  final Map<DateTime, List<CleanCalendarEvent>> events =
  {
    // DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
    //   CleanCalendarEvent('Location: ครัวสนั่น',
    //       location: "Bangkok",
    //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, 10, 0),
    //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, 12, 0),
    //       description: 'restaurant',
    //       color: Colors.orange),
    // ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Location: แพน คาเฟ่',
          location: "Bangkok",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          description: 'cafe',
          color: Colors.orange),
      CleanCalendarEvent('Location: พระที่นั่งและสวน',
          location: "Bangkok",
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          description: 'park',
          color: Colors.orange),
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
    return SafeArea(
      child: Calendar(
        startOnMonday: true,
        selectedColor: Styles.buttonColor,
        todayColor: Styles.buttonColor,
        eventColor: Colors.red,
        eventDoneColor: Colors.amber,
        bottomBarColor: Colors.green,
        onDateSelected: (date) {
          return _handleData(date);
        },
        events: events,
        isExpanded: true,
        dayOfWeekStyle: const TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.w100),
        bottomBarTextStyle: const TextStyle(
          color: Colors.black12,
        ),
        hideBottomBar: false,
        hideArrows: false,
        weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      ),
    );
  }
}
