// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gogotrip/constants/styles.dart';
//
// import '../screens/detail_place/detail_screen.dart';
//
// class RecommendCard extends StatefulWidget {
//   const RecommendCard({Key? key}) : super(key: key);
//
//   @override
//   State<RecommendCard> createState() => _RecommendCardState();
// }
//
// class _RecommendCardState extends State<RecommendCard> {
//
//   final CollectionReference checkCollection =
//   FirebaseFirestore.instance.collection('checks');
//   final CollectionReference templeRating =
//   FirebaseFirestore.instance.collection('temples');
//   final CollectionReference restaurantRating =
//   FirebaseFirestore.instance.collection('restaurants');
//   final CollectionReference beachRating =
//   FirebaseFirestore.instance.collection('beaches');
//   final CollectionReference parkRating =
//   FirebaseFirestore.instance.collection('parks');
//   final CollectionReference cafeRating =
//   FirebaseFirestore.instance.collection('cafes');
//
//   String place = '';
//   String placeId = '';
//   String placeInfo = '';
//   String placeClose = '';
//   String placeOpen = '';
//   String placeName = '';
//   String placeUrl = '';
//   String detailReload = '';
//   String countVoteRating = '';
//   String voteRating = '5';
//   List<dynamic> field = [];
//
//   getDataFromPlace() async {
//
//     final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
//     if (snapshot.exists) {
//       setState(() {
//         place = snapshot.get('place');
//         placeClose = snapshot.get('placeClose');
//         placeId = snapshot.get('placeId');
//         placeInfo = snapshot.get('placeInfo');
//         placeName = snapshot.get('placeName');
//         placeOpen = snapshot.get('placeOpen');
//         placeUrl = snapshot.get('placeUrl');
//         detailReload = snapshot.get('detailReload');
//         //print("Slidesssssssssss"+place);
//       });
//     }
//   }
//   // getDataFromRating() async {
//   //   if (place == "Temple") {
//   //     final DocumentSnapshot getTempleRating =
//   //     await templeRating.doc(placeId).get();
//   //     if (getTempleRating.exists) {
//   //       setState(() {
//   //         countVoteRating = getTempleRating.get('countVoteRating');
//   //         voteRating = getTempleRating.get('voteRating');
//   //       });
//   //     }
//   //   } else if (place == "Beach") {
//   //     final DocumentSnapshot getBeachRating =
//   //     await beachRating.doc(placeId).get();
//   //     if (getBeachRating.exists) {
//   //       setState(() {
//   //         countVoteRating = getBeachRating.get('countVoteRating');
//   //         voteRating = getBeachRating.get('voteRating');
//   //       });
//   //     }
//   //   } else if (place == "Restaurant") {
//   //     final DocumentSnapshot getRestaurantRating =
//   //     await restaurantRating.doc(placeId).get();
//   //     if (getRestaurantRating.exists) {
//   //       setState(() {
//   //         countVoteRating = getRestaurantRating.get('countVoteRating');
//   //         voteRating = getRestaurantRating.get('voteRating');
//   //       });
//   //     }
//   //   } else if (place == "Park") {
//   //     final DocumentSnapshot getParkRating =
//   //     await parkRating.doc(placeId).get();
//   //     if (getParkRating.exists) {
//   //       setState(() {
//   //         countVoteRating = getParkRating.get('countVoteRating');
//   //         voteRating = getParkRating.get('voteRating');
//   //       });
//   //     }
//   //   } else {
//   //     final DocumentSnapshot getCafeRating =
//   //     await cafeRating.doc(placeId).get();
//   //     if (getCafeRating.exists) {
//   //       setState(() {
//   //         countVoteRating = getCafeRating.get('countVoteRating');
//   //         voteRating = getCafeRating.get('voteRating');
//   //       });
//   //     }
//   //   }
//   // }
//   recommend(){
//     if(place == "Temple") {
//       FirebaseFirestore.instance.collection('temples')
//           .get().then((value) async {
//         for ( var x in value.docs){
//           final DocumentSnapshot templeSnapshot = await templeRating.doc(x.id).get();
//           if (templeSnapshot.exists) {
//             setState(() {
//               if(double.parse(templeSnapshot.get('voteRating')) >= 4){
//                 final docRef = FirebaseFirestore.instance.collection('temples').doc(x.id);
//                 docRef.get().then((docSnapshot) {
//                   if (docSnapshot.exists) {
//                     field = docSnapshot.data()!['Info'];
//                     print(field.length);
//                     for(int i = 0; i < field.length; i++ ) {
//                       print(field[i]);
//                     }
//
//                   }
//                 });
//
//               }
//             });
//           }
//         }
//       });
//     }
//     else if(place == "Restaurant"){
//       FirebaseFirestore.instance.collection('restaurants')
//           .get().then((value) async {
//         for ( var x in value.docs){
//           final DocumentSnapshot restaurantSnapshot = await restaurantRating.doc(x.id).get();
//           if (restaurantSnapshot.exists) {
//             setState(() {
//               if(double.parse(restaurantSnapshot.get('voteRating')) >= 4){
//                 final docRef = FirebaseFirestore.instance.collection('restaurants').doc(x.id);
//                 docRef.get().then((docSnapshot) {
//                   if (docSnapshot.exists) {
//                     field = docSnapshot.data()!['Info'];
//                     print(field.length);
//                     for(int i = 0; i < field.length; i++ ) {
//                       print(field[i]);
//                     }
//                   }
//                 });
//               }
//             });
//           }
//         }
//       });
//     }
//     else if(place == "Beach"){
//       FirebaseFirestore.instance.collection('beaches')
//           .get().then((value) async {
//         for ( var x in value.docs){
//           final DocumentSnapshot beachSnapshot = await beachRating.doc(x.id).get();
//           if (beachSnapshot.exists) {
//             setState(() {
//               if(double.parse(beachSnapshot.get('voteRating')) >= 4){
//                 final docRef = FirebaseFirestore.instance.collection('beaches').doc(x.id);
//                 docRef.get().then((docSnapshot) {
//                   if (docSnapshot.exists) {
//                     field = docSnapshot.data()!['Info'];
//                     print(field.length);
//                     for(int i = 0; i < field.length; i++ ) {
//                       print(field[i]);
//                     }
//                   }
//                 });
//               }
//             });
//           }
//         }
//       });
//     }
//     else if(place == "Park"){
//       FirebaseFirestore.instance.collection('parks')
//           .get().then((value) async {
//         for ( var x in value.docs){
//           final DocumentSnapshot parkSnapshot = await parkRating.doc(x.id).get();
//           if (parkSnapshot.exists) {
//             setState(() {
//               if(double.parse(parkSnapshot.get('voteRating')) >= 4.0){
//                 final docRef = FirebaseFirestore.instance.collection('parks').doc(x.id);
//                 docRef.get().then((docSnapshot) {
//                   if (docSnapshot.exists) {
//                     field = docSnapshot.data()!['Info'];
//                     print(field.length);
//                     for(int i = 0; i < field.length; i++ ) {
//                       print(field[i]);
//                     }
//                   }
//                 });
//               }
//             });
//           }
//         }
//       });
//     }
//     else{
//       FirebaseFirestore.instance.collection('cafes')
//           .get().then((value) async {
//         for ( var x in value.docs){
//           final DocumentSnapshot cafeSnapshot = await cafeRating.doc(x.id).get();
//           if (cafeSnapshot.exists) {
//             setState(() {
//               if(double.parse(cafeSnapshot.get('voteRating')) >= 4){
//                 final docRef = FirebaseFirestore.instance.collection('cafes').doc(x.id);
//                 docRef.get().then((docSnapshot) {
//                   if (docSnapshot.exists) {
//                     field = docSnapshot.data()!['Info'];
//                     print(field.length);
//                     for(int i = 0; i < field.length; i++ ) {
//                       print(field[i]);
//                     }
//
//                   }
//                 });
//               }
//             });
//           }
//         }
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getDataFromPlace();
//     Future.delayed(Duration(milliseconds: 900), () {
//       recommend();
//     });
//
//   }
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 220,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: field == null ? 0 : field.length,
//           //itemCount: dataDetail == null ? 0 : dataDetail?["result"].length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(left: 5.0, right: 5),
//               child: InkWell(
//
//                 onTap: ()
//                 {
//                   firestore.collection('checks').doc('state').update({
//                     'detailReload': 'False'
//                   });
//                   firestore.collection('checks').doc('state').update({
//                     'placeId': field[2]
//                   });
//                   firestore.collection('checks').doc('state').update({
//                     'placeName': field[4]
//                   });
//                   firestore.collection('checks').doc('state').update({
//                     'placeUrl': field[5]
//                   });
//
//
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                         const DetailScreen(
//                           data: null,
//                           // data: "${_data?['result'][index]['place_id']}"
//                         ),
//                       ));
//
//                 },
//                 child: Container(
//                   width: 165,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                       boxShadow: Styles.boxShadows),
//                   child: Column(
//
//                     children: [
//                       // Text("${data?['result'][index]['place_id']}"),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         height: 105,
//                         width: 125,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(field[5]) != ''
//                                     ? NetworkImage(field[5])
//                                     : AssetImage("assets/images/beach.png")
//                                 as ImageProvider,
//                                 fit: BoxFit.fill),
//                             color: Colors.white,
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: Styles.boxShadows),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 3.0, right: 3),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               child: Text(field[4],
//                                 style: const TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.bold),
//                                 overflow: TextOverflow.clip,
//                                 maxLines: 1,
//                                 softWrap: true,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("X",
//                                     style: const TextStyle(fontSize: 16)),
//                                 const SizedBox(width: 3),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.only(top: 6.0, right: 5),
//                                       child: Row(
//                                         children: const [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.lime,
//                                             size: 17,
//                                           ),
//                                           Text(
//                                             "4",
//                                             style: TextStyle(fontSize: 12),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/beach_model.dart';
import 'package:gogotrip/controllers/cafe_model.dart';
import 'package:gogotrip/controllers/park_model.dart';
import 'package:gogotrip/controllers/restaurant_model.dart';
import 'package:gogotrip/controllers/temple_model.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class RecommendCard extends StatefulWidget {
  RecommendCard({Key? key}) : super(key: key);

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  TempleModel sameTempleCheck = TempleModel();
  ParkModel sameParkCheck = ParkModel();
  CafeModel sameCafeCheck = CafeModel();

  Map<dynamic, dynamic>? data;
  bool check = false;

  Map<dynamic, dynamic>? dataDetail;

  final CollectionReference checkCollection =
      FirebaseFirestore.instance.collection('checks');
  final CollectionReference templeRating =
      FirebaseFirestore.instance.collection('temples');
  final CollectionReference restaurantRating =
      FirebaseFirestore.instance.collection('restaurants');
  final CollectionReference beachRating =
      FirebaseFirestore.instance.collection('beaches');
  final CollectionReference parkRating =
      FirebaseFirestore.instance.collection('parks');
  final CollectionReference cafeRating =
      FirebaseFirestore.instance.collection('cafes');

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  String countVoteRating = '';
  String voteRating = '5';
  List<dynamic> field = [];
  int countRec = 0;
  List<dynamic> ids = [];
  List<String> collectRate = [];
  bool _timerFinished = false;

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

  recommend() async {
    if (place == "Temple") {
      await FirebaseFirestore.instance
          .collection('temples')
          .get()
          .then((value) async {
        for (var x in value.docs) {
          final DocumentSnapshot templeSnapshot =
              await templeRating.doc(x.id).get();
          if (templeSnapshot.exists) {
            if (double.parse(templeSnapshot.get('voteRating')) >= 4) {
              collectRate.add(templeSnapshot.get('voteRating'));
              final docRef =
                  FirebaseFirestore.instance.collection('temples').doc(x.id);
              docRef.get().then((docSnapshot) {
                if (docSnapshot.exists) {
                  field = docSnapshot.data()!['Info'];
                  //ids.add(docSnapshot.data()!['Info']);
                  for (int i = 0; i < field.length; i++) {
                    if (i != 3) {
                      ids.add(field[i]);
                    }
                  }
                }
              });
              countRec++;
            }
          }
        }
        setState(() {
          ids;
          countRec;
          collectRate;
        });
      });
    } else if (place == "Restaurant") {
      FirebaseFirestore.instance
          .collection('restaurants')
          .get()
          .then((value) async {
        for (var x in value.docs) {
          final DocumentSnapshot restaurantSnapshot =
              await restaurantRating.doc(x.id).get();
          if (restaurantSnapshot.exists) {
            if (double.parse(restaurantSnapshot.get('voteRating')) >= 4) {
              collectRate.add(restaurantSnapshot.get('voteRating'));
              final docRef = FirebaseFirestore.instance
                  .collection('restaurants')
                  .doc(x.id);
              docRef.get().then((docSnapshot) {
                if (docSnapshot.exists) {
                  field = docSnapshot.data()!['Info'];
                  for (int i = 0; i < field.length; i++) {
                    print("X");
                    if (i != 3) {
                      ids.add(field[i]);
                    }
                  }
                }
              });
              countRec++;
            }
          }
        }
        setState(() {
          ids;
          countRec;
          collectRate;
        });
      });
    } else if (place == "Beach") {
      FirebaseFirestore.instance
          .collection('beaches')
          .get()
          .then((value) async {
        for (var x in value.docs) {
          final DocumentSnapshot beachSnapshot =
              await beachRating.doc(x.id).get();
          if (beachSnapshot.exists) {
            setState(() {
              if (double.parse(beachSnapshot.get('voteRating')) >= 4) {
                collectRate.add(beachSnapshot.get('voteRating'));
                final docRef =
                    FirebaseFirestore.instance.collection('beaches').doc(x.id);
                docRef.get().then((docSnapshot) {
                  if (docSnapshot.exists) {
                    setState(() {
                      field = docSnapshot.data()!['Info'];
                    });
                    print(field.length);
                    for (int i = 0; i < field.length; i++) {
                      if (i != 3) {
                        ids.add(field[i]);
                      }
                    }
                  }
                });
                countRec++;
              }
            });
          }
        }
        setState(() {
          ids;
          countRec;
          collectRate;
        });
      });
    } else if (place == "Park") {
      FirebaseFirestore.instance.collection('parks').get().then((value) async {
        for (var x in value.docs) {
          final DocumentSnapshot parkSnapshot =
              await parkRating.doc(x.id).get();
          if (parkSnapshot.exists) {
            setState(() {
              if (double.parse(parkSnapshot.get('voteRating')) >= 4.0) {
                collectRate.add(parkSnapshot.get('voteRating'));
                final docRef =
                    FirebaseFirestore.instance.collection('parks').doc(x.id);
                docRef.get().then((docSnapshot) {
                  if (docSnapshot.exists) {
                    setState(() {
                      field = docSnapshot.data()!['Info'];
                    });
                    print(field.length);
                    for (int i = 0; i < field.length; i++) {
                      if (i != 3) {
                        ids.add(field[i]);
                      }
                    }
                  }
                });
                countRec++;
              }
            });
          }
        }
        setState(() {
          ids;
          countRec;
          collectRate;
        });
      });
    } else {
      FirebaseFirestore.instance.collection('cafes').get().then((value) async {
        for (var x in value.docs) {
          final DocumentSnapshot cafeSnapshot =
              await cafeRating.doc(x.id).get();
          if (cafeSnapshot.exists) {
            setState(() {
              if (double.parse(cafeSnapshot.get('voteRating')) >= 4) {
                collectRate.add(cafeSnapshot.get('voteRating'));
                final docRef =
                    FirebaseFirestore.instance.collection('cafes').doc(x.id);
                docRef.get().then((docSnapshot) {
                  if (docSnapshot.exists) {
                    setState(() {
                      field = docSnapshot.data()!['Info'];
                    });
                    print(field.length);
                    for (int i = 0; i < field.length; i++) {
                      if (i != 3) {
                        ids.add(field[i]);
                      }
                    }
                  }
                });
                countRec++;
              }
            });
          }
        }
        setState(() {
          ids;
          countRec;
          collectRate;
        });
      });
    }
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _timerFinished = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(Duration(milliseconds: 500), () {
      recommend();
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return _timerFinished
        ? Container(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: countRec,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: InkWell(
                      onTap: () {
                        firestore
                            .collection('checks')
                            .doc('state')
                            .update({'detailReload': 'False'});
                        firestore
                            .collection('checks')
                            .doc('state')
                            .update({'placeId': ids[(5 * index) + 2]});
                        firestore
                            .collection('checks')
                            .doc('state')
                            .update({'placeName': ids[(5 * index) + 3]});
                        firestore
                            .collection('checks')
                            .doc('state')
                            .update({'placeUrl': ids[(5 * index) + 4]});

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailScreen(
                                data: null,
                              ),
                            ));
                      },
                      child: Container(
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: Styles.boxShadows,
                          image: DecorationImage(
                              image: NetworkImage(ids[(5 * index) + 4]) != ""
                                  ? NetworkImage(ids[(5 * index) + 4])
                                  : AssetImage("assets/images/beach.png")
                                      as ImageProvider,
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6.0, right: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.lime,
                                          size: 17,
                                        ),
                                        Text(
                                          collectRate[index],
                                          //"4",
                                          style:
                                          TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           SizedBox(
                              height: 75,
                            ),
                            Container(
                              width: 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Styles.bgBackground1,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        ids[(5 * index) + 3],
                                        style: GoogleFonts.deliusUnicase(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.black,
                                          size: 14,
                                        ),
                                        Text("กรุงเทพมหานคร",
                                            style: GoogleFonts.deliusUnicase(
                                              fontSize: 14,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(child: CircularProgressIndicator());
  }
}
