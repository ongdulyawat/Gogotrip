import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Styles.bgBackground,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 80,),
              Text("test"),
              Text("test"),
              Text("test"),
              Text("test"),
              Text("test"),
            ],
          ),
        ),
      ),
    );
  }
}
