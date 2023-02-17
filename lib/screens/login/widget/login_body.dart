//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';
// import 'package:gogotrip/controller/user_controller.dart';


class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  // final controllerUsername = TextEditingController();
  // final controllerPassword = TextEditingController();

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
              // controller: controllerUsername,
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
              // controller: controllerPassword,
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
            // final user = User(
            // username: controllerUsername.text,
            // password: controllerPassword.text,
            // );
            // createUser(user);
            // userSetup(_usernameController.text);
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Styles.buttonColor,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                  child: Text(
                    "Sign in",
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
  // Future createUser(User user) async {
  //   final docUser = FirebaseFirestore.instance.collection('users').doc();
  //   user.id = docUser.id;
  //
  //   final json = user.toJson();
  //   await docUser.set(json);
  // }
}
