import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';

class DetailHeader extends StatefulWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {

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
    return Container(
      color: Colors.transparent,
      // width: 376,
      // height:300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 34, left: 15, bottom: 20),
            child: GestureDetector(
              onTap: () {
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                }
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
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
            child: Container(
              width: 375,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    //image: AssetImage('assets/images/beach.png'),
                    image : NetworkImage(placeUrl),
                    fit: BoxFit.fill
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: Styles.boxShadows,
              ),
            ),
          )
        ],
      ),
    );
  }
}
