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
        Text("Create on account",
            style: GoogleFonts.kranky(fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
