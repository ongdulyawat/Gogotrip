import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Party",
              style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontSize: 30))),
          Container(),
        ],
      ),
    );
  }
}
