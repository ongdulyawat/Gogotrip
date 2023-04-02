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
  final CollectionReference checkCollection =
      FirebaseFirestore.instance.collection('checks');

  String placeUrl = '';

  getDataFromPlace() async {
    final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
    if (snapshot.exists) {
      setState(() {
        placeUrl = snapshot.get('placeUrl');
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(placeUrl) != ''
                  ? NetworkImage(placeUrl)
                  : const AssetImage("assets/images/beach.png")
                      as ImageProvider,
              // image: NetworkImage(placeUrl) != ""
              //     ? NetworkImage(placeUrl)
              //     : AssetImage("assets/images/beach.png")
              // as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Column(
              children: [DetailHeader(), SizedBox(height: 20), DetailBody()],
            ),
          ),
        ),
      ),
    );
  }
}
