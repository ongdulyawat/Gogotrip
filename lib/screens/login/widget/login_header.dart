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
    return Padding(
      padding: const EdgeInsets.only(left: 195.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Let's travel",
            style: GoogleFonts.kranky(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "with",
            style: GoogleFonts.kranky(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Gogotrip!",
            style: GoogleFonts.kranky(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
