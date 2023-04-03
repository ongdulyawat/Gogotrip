import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gogotrip/screens/register/widget/register_body.dart';
import 'package:gogotrip/screens/register/widget/register_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/resister_wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RegisterHeader(),
                SizedBox(
                  height: 30,
                ),
                RegisterBody(),
                SizedBox(
                  height: 25,
                  width: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
