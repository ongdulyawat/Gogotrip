import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.bgBackground,
      body: SingleChildScrollView(
      ),
      // bottomNavigationBar:
    );
  }
}
