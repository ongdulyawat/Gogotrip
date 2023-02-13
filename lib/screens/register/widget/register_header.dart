import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHeader extends StatefulWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  State<RegisterHeader> createState() => _RegisterHeaderState();
}

class _RegisterHeaderState extends State<RegisterHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Hey there!",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Create on account",
          // style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          style: GoogleFonts.bebasNeue(fontSize: 52),
        ),
      ],
    );
  }
}
