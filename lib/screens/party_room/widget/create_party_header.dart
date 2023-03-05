import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/user_model.dart';
import 'package:gogotrip/screens/party_room/party_screen.dart';

class CreatePartyHeader extends StatefulWidget {
  const CreatePartyHeader({Key? key}) : super(key: key);

  @override
  State<CreatePartyHeader> createState() => _CreatePartyHeaderState();
}

class _CreatePartyHeaderState extends State<CreatePartyHeader> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 245),
            child: Container(
              padding: const EdgeInsets.only(top: 34, left: 10, bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(const PartyScreen());
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28)),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0,right: 35),
              child: Container(
                height: 35,
                width: 35,
                decoration: '${loggedInUser.image}' == '-'
                    ? BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/user.png'),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Styles.boxShadows)
                    : BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${loggedInUser.image}'),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Styles.boxShadows),
              ),
            ))
      ],
    );
  }
}
