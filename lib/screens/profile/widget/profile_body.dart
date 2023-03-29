import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/user_model.dart';
import '../profile_screen.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _lineController = TextEditingController();

  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');

  final formKey = GlobalKey<FormState>();

  //final _controller = TextEditingController();
  // String ig = "Ong vst";
  // String facebook = "Ong dyw";
  // String line = "-";
  @override
  Widget build(BuildContext context) {
    firestore
        .collection('checks')
        .doc('state')
        .update({'search': ''});
    return Container(
      width: 250,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Form(
        key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/instagram.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text("${loggedInUser.instagram}",
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change IG"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("${loggedInUser.instagram}"),
                                      TextFormField(
                                        controller: _instagramController,
                                        decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent),
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                            prefixIcon: Image.asset(
                                              "assets/icons/pencil.png",
                                              width: 10,
                                              height: 10,
                                            ),
                                            hintText: "IG",
                                            filled: true,
                                            fillColor: Styles.bgBackground
                                        ),
                                        validator: (value) => value != null && value.length < 1
                                            ? 'Please enter Username'
                                            : null,

                                        // validator: (value) {
                                        //
                                        //   if (value == null || value.isEmpty)
                                        //   {
                                        //     print("TTTTTTTEST");
                                        //     return 'Please enter Username';
                                        //   }
                                        //   return null;
                                        // },
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () async {
                                            final isValid = formKey.currentState!.validate();
                                            if (!isValid) return;
                                            {
                                              final String instagram = _instagramController.text.trim();
                                              if (instagram != null) {
                                                await _users.doc(user!.uid)
                                                //.doc(documentSnapshot!.id)
                                                    .update({"instagram": instagram});
                                                //_instagramController.text = '';
                                                //Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const ProfileScreen(),
                                                    ));
                                                //Get.back();
                                              }
                                              print("ERROR");
                                            }

                                            // setState(() {
                                            //   ig =
                                            //       _controller.text;
                                            // });
                                            // Navigator.of(context).pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                    //Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ProfileScreen(),
                    //     ));
                  },
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/facebook.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text("${loggedInUser.facebook}",
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change Facebook"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("${loggedInUser.facebook}"),
                                      Container(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: _facebookController,
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              prefixIcon: Image.asset(
                                                "assets/icons/pencil.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                              hintText: "Facebook",
                                              filled: true,
                                              fillColor: Styles.bgBackground
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () async {
                                            final isValid = formKey.currentState!.validate();
                                            if (!isValid) return;
                                            {
                                              final String facebook = _facebookController.text.trim();
                                              if (facebook != null) {
                                                await _users
                                                    .doc(user!.uid)
                                                //.doc(documentSnapshot!.id)
                                                    .update({"facebook": facebook});
                                                //_facebookController.text = '';
                                                //Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const ProfileScreen(),
                                                    ));
                                                //Get.back();
                                              }
                                              print("ERROR account facebook");
                                            }
                                            // setState(() {
                                            //   facebook =
                                            //       _controller.text;
                                            // });
                                            // Navigator.of(context).pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                    //Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ProfileScreen(),
                    //     ));
                  },
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/line.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text("${loggedInUser.line}",
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change Line"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("${loggedInUser.line}"),
                                      Container(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: _lineController,
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              prefixIcon: Image.asset(
                                                "assets/icons/pencil.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                              hintText: "Line",
                                              filled: true,
                                              fillColor: Styles.bgBackground
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () async {
                                            final isValid = formKey.currentState!.validate();
                                            if (!isValid) return;
                                            {
                                              final String line = _lineController.text.trim();
                                              if (line != null) {
                                                await _users
                                                    .doc(user!.uid)
                                                //.doc(documentSnapshot!.id)
                                                    .update({"line": line});
                                                //_lineController.text = '';
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const ProfileScreen(),
                                                    ));
                                                //Get.back();
                                                //Navigator.of(context).pop();
                                              }
                                              print("ERROR account LINE");
                                            }

                                            // setState(() {
                                            //   line =
                                            //       _controller.text;
                                            // });
                                            // Navigator.of(context).pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                    //Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ProfileScreen(),
                    //     ));
                  },
                )
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
