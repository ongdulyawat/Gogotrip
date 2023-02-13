import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

import 'package:gogotrip/screens/login/widget/login_body.dart';
import 'package:gogotrip/screens/login/widget/login_footer.dart';
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
      backgroundColor: Styles.bgBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 65,
                ),
                LoginHeader(),
                SizedBox(
                  height: 30,
                ),
                LoginBody(),
                SizedBox(
                  height: 25,
                ),
                LoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
