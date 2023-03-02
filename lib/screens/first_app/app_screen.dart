import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';
import 'package:gogotrip/screens/login/login_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(const LoginScreen());
    });
    // Timer(const Duration(seconds: 3), () {
    //   Get.to(const HomePage());
    // });
    return const Scaffold(
      backgroundColor: Styles.buttonColor,
      body: Center(
        child: Text(
          "Gogotrip",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
