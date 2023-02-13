import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.beach_access,
          size: 75,
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          "Hello Again!",
          // style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          style: GoogleFonts.bebasNeue(fontSize: 52),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome back, let\'s sign for enjoy the travel!",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
