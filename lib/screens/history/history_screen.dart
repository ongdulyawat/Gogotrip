import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/history/widget/history_body.dart';
import 'package:gogotrip/screens/history/widget/history_header.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgBackground,
      // appBar: ,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HistoryHeader(),
            SizedBox(height: 1),
            HistoryBody()
          ],
        ),
      ),
    );
  }
}
