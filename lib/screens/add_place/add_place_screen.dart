import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
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
