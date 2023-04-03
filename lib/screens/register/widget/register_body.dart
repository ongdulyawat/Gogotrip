import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/user_model.dart';
import 'package:gogotrip/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/utils.dart';
import '../../../main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10),
              child: Text("Let's register",
                  style: GoogleFonts.deliusUnicase(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Styles.buttonColor)),
                child: TextFormField(
                  controller: _firstnameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "First Name",
                      contentPadding: EdgeInsets.only(top: 15)),
                  validator: (value) => value != null && value.length < 1
                      ? 'Please enter Firstname'
                      : null,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Styles.buttonColor)),
                child: TextFormField(
                  controller: _lastnameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Last Name",
                      contentPadding: EdgeInsets.only(top: 15)),
                  validator: (value) => value != null && value.length < 1
                      ? 'Please enter Lastname'
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Styles.buttonColor)),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Username",
                      contentPadding: EdgeInsets.only(top: 15)),
                  validator: (value) => value != null && value.length < 1
                      ? 'Please enter Username'
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Styles.buttonColor)),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: "E-mail",
                      contentPadding: EdgeInsets.only(top: 15)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid Email'
                          : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Styles.buttonColor)),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                      contentPadding: EdgeInsets.only(top: 15)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Please enter more 6 character'
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: GestureDetector(
                onTap: () async {
                  final isValid = formKey.currentState!.validate();
                  if (!isValid) return;
                  {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());

                      FirebaseFirestore firebaseFirestore =
                          FirebaseFirestore.instance;
                      User? user = _auth.currentUser;

                      UserModel userModel = UserModel();
                      userModel.email = user!.email;
                      userModel.uid = user!.uid;
                      userModel.firstname = _firstnameController.text.trim();
                      userModel.lastname = _lastnameController.text.trim();
                      //userModel.email = _emailController.text.trim();
                      userModel.username = _usernameController.text.trim();
                      userModel.password = _passwordController.text.trim();
                      userModel.describe = "-";
                      userModel.instagram = "-";
                      userModel.facebook = "-";
                      userModel.line = "-";
                      userModel.image = "-";
                      userModel.createCount = "0";
                      userModel.joinCount = "0";
                      userModel.like = "0";
                      userModel.join = [];
                      userModel.create = [];
                      userModel.favorite = [];
                      // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      //   'join': FieldValue.arrayUnion([]),
                      // });
                      // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      //   'create': FieldValue.arrayUnion([]),
                      // });
                      // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      //   'favorite': FieldValue.arrayUnion([]),
                      // });

                      await firebaseFirestore
                          .collection("users")
                          .doc(user.uid)
                          .set(userModel.toMap());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    } on FirebaseAuthException catch (e) {
                      print(e);
                      Utils.showSnackBar(e.message);
                    }
                  }
                  ;
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Styles.buttonColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: GoogleFonts.deliusUnicase(
                        fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.deliusUnicase(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: Text(
                      " Sign in",
                      style: GoogleFonts.deliusUnicase(
                          fontSize: 12,
                          color: Styles.buttonColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
