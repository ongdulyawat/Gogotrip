import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import 'package:gogotrip/widget/location_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  //final CollectionReference checkCollection = FirebaseFirestore.instance.collection('checks');

  // String place = '';
  // getDataFromPlace() async {
  //   final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
  //
  //   if (snapshot.exists) {
  //     setState(() {
  //       place = snapshot.get('place');
  //       print("Hello"+place);
  //     });
  //   }
  // }
  //String location = place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                child: Text(
                  "Beach",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              //LocationCard(locations: location)
              LocationCard()
            ],
          ),
        ),
        bottomNavigationBar: const HomeFooter()
        // bottomNavigationBar:
        );
  }
}
