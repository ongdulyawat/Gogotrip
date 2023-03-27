import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/widget/location_card.dart';
import 'package:gogotrip/widget/recommend_card.dart';
import 'package:gogotrip/widget/slide_location.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideLocation(),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Row(
            children: <Widget>[
              const Text('Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: Styles.boxShadows),
                  //child: const Padding(
                    //padding: EdgeInsets.all(8.0),
                    // child: Text("View all", style: TextStyle(fontSize: 14)),
                  //),
                ),
              )
            ],
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: LocationCard(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            children: <Widget>[
              const Text('Recommend',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: Styles.boxShadows),
                  // child: const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text("View all", style: TextStyle(fontSize: 14)),
                  // ),
                ),
              )
            ],
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: RecommendCard(),
        ),
      ],
    );
  }
}
