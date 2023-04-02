import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:gogotrip/screens/login/widget/login_body.dart';
import 'package:gogotrip/screens/login/widget/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_wallpaper.png")
                  as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 65,
                ),
                LoginHeader(),
                SizedBox(
                  height: 60,
                ),
                LoginBody(),
                SizedBox(
                  height: 80,
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
