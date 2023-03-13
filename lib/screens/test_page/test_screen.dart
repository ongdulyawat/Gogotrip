import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:gogotrip/constants/styles.dart';

import '../../controllers/user_model.dart';
import '../../main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference templesCollection = FirebaseFirestore.instance
      .collection('temples');

  final CollectionReference checkCollection = FirebaseFirestore.instance
      .collection('checks');
  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  List <dynamic> data = [];

  //void get data => null;

  //int datalength = 4;

  getDataFromPlace() async {
    final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
    if (snapshot.exists) {
      setState(() {
        place = snapshot.get('place');
        placeClose = snapshot.get('placeClose');
        placeId = snapshot.get('placeId');
        placeInfo = snapshot.get('placeInfo');
        placeName = snapshot.get('placeName');
        placeOpen = snapshot.get('placeOpen');
        placeUrl = snapshot.get('placeUrl');
        detailReload = snapshot.get('detailReload');
        //print("Slidesssssssssss"+place);
      });
    }
  }
  // retrieve() async {
  //   final DocumentSnapshot snapshotRetrieve = await templesCollection .doc(placeId).get();
  //   setState(() {
  //     data = snapshotRetrieve.data()!.entries
  //         .where((entry) => entry.key != 'Info')
  //         .map((entry) => entry.value)
  //         .toList();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  void retrieve() async {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

