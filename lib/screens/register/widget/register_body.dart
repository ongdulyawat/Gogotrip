import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/user_model.dart';
import 'package:gogotrip/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return GestureDetector(
  //           onTap: () async {
  //             final String username = _usernameController.text;
  //             final String password = _passwordController.text;
  //             final String firstname = _firstnameController.text;
  //             final String lastname = _lastnameController.text;
  //             final String email = _emailController.text;
  //
  //             if (password != null) {
  //               await _users.add({
  //                 "username": username,
  //                 "password": password,
  //                 "firstname": firstname,
  //                 "lastname": lastname,
  //                 "email": email
  //               });
  //
  //               _usernameController.text = '';
  //               _passwordController.text = '';
  //               _firstnameController.text = '';
  //               _lastnameController.text = '';
  //               _emailController.text = '';
  //               Navigator.of(context).pop();
  //             }
  //           },
  //         );
  //       });
  // }

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [

            Padding(

            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
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
              decoration: BoxDecoration(

                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
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
              // onPressed: () => _create(),
              onTap: () async {
                final isValid = formKey.currentState!.validate();
                if (!isValid) return;
                {
                  // final String username = _usernameController.text.trim();
                  // final String password = _passwordController.text.trim();
                  // final String firstname = _firstnameController.text.trim();
                  // final String lastname = _lastnameController.text.trim();
                  // final String email = _emailController.text.trim();
                  //
                  // await _users.add({
                  //     "username": username,
                  //     "password": password,
                  //     "firstname": firstname,
                  //     "lastname": lastname,
                  //     "email": email
                  //   });
                  try{
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());

                    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                    User? user = _auth.currentUser;

                    UserModel userModel = UserModel();
                    userModel.email = user!.email;
                    userModel.uid = user!.uid;
                    userModel.firstname = _firstnameController.text.trim();
                    userModel.lastname = _lastnameController.text.trim();
                    userModel.email = _emailController.text.trim();
                    userModel.username = _usernameController.text.trim();
                    userModel.password = _passwordController.text.trim();
                    userModel.describe = "-";
                    userModel.instagram = "-";
                    userModel.facebook = "-";
                    userModel.line = "-";
                    userModel.image = "-";
                    userModel.createCount = "0";
                    userModel.joinCount = "0";

                    await firebaseFirestore
                        .collection("users").doc(user.uid).set(userModel.toMap());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));

                  }
                  on FirebaseAuthException catch (e){
                    print(e);
                    Utils.showSnackBar(e.message);
                    print("Already used");

                  }

                  // Navigator.of(context).pop();

                  // if (password != null) {
                  //   await _users.add({
                  //     "username": username,
                  //     "password": password,
                  //     "firstname": firstname,
                  //     "lastname": lastname,
                  //     "email": email
                  //   });
                  //   _usernameController.text = '';
                  //   _passwordController.text = '';
                  //   _firstnameController.text = '';
                  //   _lastnameController.text = '';
                  //   _emailController.text = '';
                  //   Navigator.of(context).pop();
                  // }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const LoginScreen(),
                  //     ));
                };
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
      ),
    );
  }
  // Future registerUser() async{
  //   try{
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim());
  //   }
  //   on FirebaseAuthException catch (e){
  //     print(e);
  //   }
  //  }

  // postDetailsToFirestore() async{
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //
  //   UserModel userModel = UserModel();
  //   userModel.email = user!.email;
  //   userModel.uid = user!.uid;
  //   userModel.firstname = _firstnameController.text.trim();
  //   userModel.lastname = _lastnameController.text.trim();
  //   userModel.email = _emailController.text.trim();
  //   userModel.username = _usernameController.text.trim();
  //
  //   await firebaseFirestore
  //   .collection("user").doc(user.uid).set(userModel.toMap());
  //
  //   //Fluttertoast.showToast(msg: "Account created");
  //
  //
  //
  // }


}


// final messengerKey = GlobalKey<ScaffoldMessengerState>();
// class Utils {
//   static showSnackBar(String? text){
//     if(text == null) return;
//     final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.red);
//     messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//     print("Same email");
//   }
// }

