import 'package:flutter/material.dart';
import 'package:gogotrip/screens/register/register_screen.dart';

class LoginFooter extends StatefulWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  State<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends State<LoginFooter> {
  @override
  Widget build(BuildContext context) {
    return                 Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a member?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
          },
          child: const Text(
            " Register now",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
