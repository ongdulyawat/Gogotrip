import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/calendar/widget/calendar_body.dart';
import 'package:gogotrip/screens/calendar/widget/calendar_header.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Styles.bgBackground,
      body: CalendarBody(),
        bottomNavigationBar: HomeFooter()
    );
  }
}
