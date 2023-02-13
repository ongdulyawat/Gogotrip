import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/register/widget/register_body.dart';
import 'package:gogotrip/screens/register/widget/register_footer.dart';
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
      backgroundColor: Styles.bgBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
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
                ),
                RegisterFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
