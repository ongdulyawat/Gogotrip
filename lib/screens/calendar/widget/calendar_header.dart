import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatefulWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  State<CalendarHeader> createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 34, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat.yMMMMd().format(DateTime.now()),
              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[600],fontSize: 20))),
          const SizedBox(
            height: 2,
          ),
          Text("Today", style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontSize: 30))),
          const SizedBox(
            height: 8,
          ),
          DatePicker(
            DateTime.now(),
            width: 80,
            height: 100,
            initialSelectedDate: DateTime.now(),
            selectionColor: Styles.buttonColor,
            selectedTextColor: Colors.white,
            dateTextStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
