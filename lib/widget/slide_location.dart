import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';
import 'package:gogotrip/widget/location_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/profile/profile_screen.dart';

class SlideLocation extends StatefulWidget {
  SlideLocation({Key? key}) : super(key: key);

  @override
  State<SlideLocation> createState() => _SlideLocationState();
}

class _SlideLocationState extends State<SlideLocation> {
  final List<String> locationlists = [
    "Beach",
    "Temple",
    "Restaurant",
    "Park",
    "Cafe",
  ];

  final List<String> IconLocationlists = [

    "assets/icons/cafe.png",
    "assets/icons/park.png", //
    "assets/icons/beach.png",  //
    "assets/icons/temple.png", //
    "assets/icons/restaurant.png", //
    "assets/icons/cafe.png",
  ];

  int count = -1;
  final CollectionReference checkCollection =
      FirebaseFirestore.instance.collection('checks');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String place = '';

  getDataFromPlace() async {
    final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
    if (snapshot.exists) {
      setState(() {
        place = snapshot.get('place');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
  }

  String selectItem = '';

  @override
  Widget build(BuildContext context) {
    selectItem = place;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        color: Styles.bgBackground1,
        width: MediaQuery.of(context).size.width - 20.0,
        height: 55.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...locationlists.map((e) {
              count++;
              if (count <= 3) {
                return _buildTypes(e, count);
              } else {
                count = 0;
                return _buildTypes(e, count);
              }
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildTypes(location, count) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectItem = location;

                if (location == 'Beach') {
                  selectItem = 'Beach';
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'place': 'Beach'});
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'search': ''});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else if (location == 'Temple') {
                  selectItem = 'Temple';
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'place': 'Temple'});
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'search': ''});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else if (location == 'Restaurant') {
                  selectItem = 'Restaurant';
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'place': 'Restaurant'});
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'search': ''});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else if (location == 'Park') {
                  selectItem = 'Park';
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'place': 'Park'});
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'search': ''});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else {
                  selectItem = 'Cafe';
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'place': 'Cafe'});
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'search': ''});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: location == selectItem
                      ? Styles.buttonColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: Styles.boxShadows),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: Styles.boxShadows),
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Image.asset(
                          IconLocationlists[count+1],
                          height: 25,
                          width: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.deliusUnicase(
                          color: location == selectItem
                              ? Colors.white
                              : Colors.black,
                          fontWeight: location == selectItem
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: location == selectItem
                    ? Styles.buttonColor
                    : Colors.transparent),
          )
        ],
      ),
    );
  }
}
