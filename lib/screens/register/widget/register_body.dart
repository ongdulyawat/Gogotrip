import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/login/login_screen.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: "First Name",
                  contentPadding: EdgeInsets.only(top: 15)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: "Last Name",
                  contentPadding: EdgeInsets.only(top: 15)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: "Username",
                  contentPadding: EdgeInsets.only(top: 15)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  hintText: "E-mail",
                  contentPadding: EdgeInsets.only(top: 15)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  contentPadding: EdgeInsets.only(top: 15)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Styles.buttonColor,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                  child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ),
        ),
      ],
    );
  }
}