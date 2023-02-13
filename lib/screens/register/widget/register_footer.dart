import 'package:flutter/material.dart';
import 'package:gogotrip/screens/login/login_screen.dart';

class RegisterFooter extends StatefulWidget {
  const RegisterFooter({Key? key}) : super(key: key);

  @override
  State<RegisterFooter> createState() => _RegisterFooterState();
}

class _RegisterFooterState extends State<RegisterFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
          child: const Text(
            " Sign in",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
