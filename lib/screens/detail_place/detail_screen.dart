import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/screens/detail_place/widget/detail_body.dart';
import 'package:gogotrip/screens/detail_place/widget/detail_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required dynamic data}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final CollectionReference checkCollection = FirebaseFirestore.instance.collection('checks');

  //String place = '';
  String placeUrl = '';
  getDataFromPlace() async {
    final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
    if (snapshot.exists) {
      setState(() {
        //place = snapshot.get('place');
        placeUrl = snapshot.get('placeUrl');
        //print("Slidesssssssssss"+place);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background:AssetImage("assets/images/beach.png") as ImageProvider ,
      // appBar: ,
      body: SingleChildScrollView(
        child: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              //image: AssetImage("assets/images/beach.png"),
              image : NetworkImage(placeUrl),
              // image: NetworkImage(placeUrl) != ""
              //     ? NetworkImage(placeUrl)
              //     : AssetImage("assets/images/beach.png")
              // as ImageProvider,
              //image: AssetImage('assets/images/beach.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Column(
              children: [
                DetailHeader(),
                SizedBox(height: 20),
                DetailBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
