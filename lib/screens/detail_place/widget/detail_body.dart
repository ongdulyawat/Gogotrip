import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/party_room/party_screen.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../../controllers/user_model.dart';
import '../detail_screen.dart';

class DetailBody extends StatefulWidget {
  // String? dataId;

  // DetailBody({super.key, required this.dataId});

  DetailBody({super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  String search = '';
  String countVoteRating = '';
  String voteRating = '5';
  String a = '';
  double b = 0;
  String c = '';
  int d = 0;
  double e = 0;
  String f = '';
  String g = '';
  double rating = 0;
  String ab = '';
  double aaa = 0;
  String abc = '';
  String az = '';

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

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
        search = snapshot.get('search');
      });
    }
  }

  getDataFromRating() async {
    if (place == "Temple") {
      final DocumentSnapshot getTempleRating =
          await templeRating.doc(placeId).get();
      if (getTempleRating.exists) {
        setState(() {
          countVoteRating = getTempleRating.get('countVoteRating');
          voteRating = getTempleRating.get('voteRating');
        });
      }
    } else if (place == "Beach") {
      final DocumentSnapshot getBeachRating =
          await beachRating.doc(placeId).get();
      if (getBeachRating.exists) {
        setState(() {
          countVoteRating = getBeachRating.get('countVoteRating');
          voteRating = getBeachRating.get('voteRating');
        });
      }
    } else if (place == "Restaurant") {
      final DocumentSnapshot getRestaurantRating =
          await restaurantRating.doc(placeId).get();
      if (getRestaurantRating.exists) {
        setState(() {
          countVoteRating = getRestaurantRating.get('countVoteRating');
          voteRating = getRestaurantRating.get('voteRating');
        });
      }
    } else if (place == "Park") {
      final DocumentSnapshot getParkRating =
          await parkRating.doc(placeId).get();
      if (getParkRating.exists) {
        setState(() {
          countVoteRating = getParkRating.get('countVoteRating');
          voteRating = getParkRating.get('voteRating');
        });
      }
    } else {
      final DocumentSnapshot getCafeRating =
          await cafeRating.doc(placeId).get();
      if (getCafeRating.exists) {
        setState(() {
          countVoteRating = getCafeRating.get('countVoteRating');
          voteRating = getCafeRating.get('voteRating');
        });
      }
    }
  }

  final FirebaseFirestore firestoreDocument = FirebaseFirestore.instance;

  Future<void> checkIfDocumentExists(String documentId) async {
    if (place == "Temple") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('temples')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
      } else {
        firestoreDocument
            .collection('temples')
            .doc(placeId)
            .set({"voteRating": "0", "countVoteRating": "0"});
      }
    } else if (place == "Beach") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('beaches')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
      } else {
        firestoreDocument
            .collection('beaches')
            .doc(placeId)
            .set({"voteRating": "0", "countVoteRating": "0"});
      }
    } else if (place == "Restaurant") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('restaurants')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
      } else {
        firestoreDocument
            .collection('restaurants')
            .doc(placeId)
            .set({"voteRating": "0", "countVoteRating": "0"});
      }
    } else if (place == "Park") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('parks')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
      } else {
        firestoreDocument
            .collection('parks')
            .doc(placeId)
            .set({"voteRating": "0", "countVoteRating": "0"});
      }
    } else {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('cafes')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
      } else {
        firestoreDocument
            .collection('cafes')
            .doc(placeId)
            .set({"voteRating": "0", "countVoteRating": "0"});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(Duration(milliseconds: 1100), () {
      getData();
      checkIfDocumentExists(placeId);
      getDataFromRating();
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    Future.delayed(Duration(milliseconds: 1100), () {
      checkLike();
      clickLike();
    });
  }

  bool check = false;

  // clickButton() {
  //   setState(() {
  //     check = !check;
  //   });
  // }
  clickLike() {
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(loggedInUser.uid);

    // Retrieve the document and check if the field at index 1 is "True"
    docRef.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Get the value of the field at index 1
        List<dynamic> field = docSnapshot.data()![placeId];

        bool isTrue = field.length >= 1 && field[0] == 'True';
        // Check if the field at index 1 is "True"
        if (isTrue) {
          check = true;
        } else {
          check = false;
        }
      }
    });
  }

  checkLike() async {
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(loggedInUser.uid);
// Retrieve the document and check if the "fieldName" field exists
    docRef.get().then((docSnapshot) {
      if (docSnapshot.exists && docSnapshot.data()!.containsKey(placeId)) {
        // The field exists
      } else {
        // The field does not exist
        _users.doc(loggedInUser.uid).update({
          placeId: FieldValue.arrayUnion(["False", "-1"]),
        });
      }
    });
  }

  void _reloadPage() {
    firestore
        .collection('checks')
        .doc('state')
        .update({'detailReload': 'True'});
    // Use the Navigator class to reload the current page
    firestore.collection('checks').doc('state').update({'search': ''});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DetailScreen(
          data: null,
        ),
      ),
    );
  }

  Future<String> getData() async {
    final String apiKey =
        await "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
    // var urlBeach = await Uri.parse(
    //     'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=ทะเล&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    // var urlTemple = await Uri.parse(
    //     'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=วัด&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    // var urlRestaurant = await Uri.parse(
    //     'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    //
    // var urlPark = await Uri.parse(
    //     'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=สวนสาธารณะ&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    // var urlCafe = await Uri.parse(
    //     'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=cafe&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var detailUrlBeach = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/' + placeId);
    var detailUrlTemple = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/' + placeId);
    var detailUrlRestaurant = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/' + placeId);
    var detailUrlPark = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/' + placeId);
    var detailUrlCafe = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/restaurant/' + placeId);

    if (place == "Temple") {
      var responseInfo = await http.get(
        detailUrlTemple,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);

        setState(() {
          dataDetail = jsonResponse;
        });
      }

      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['place_information']['detail']}'
      });

      firestore.collection('checks').doc('state').update({
        'placeOpen':
            '${dataDetail?['result']['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose':
            '${dataDetail?['result']['opening_hours']['periods'][0]['close']['time']}'
      });
    } else if (place == "Beach") {
      var responseInfo = await http.get(
        detailUrlBeach,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);

        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore
          .collection('checks')
          .doc('state')
          .update({'placeInfo': '${dataDetail?['result']['sha_detail']}'});
      firestore.collection('checks').doc('state').update({
        'placeOpen':
            '${dataDetail?['result']['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose':
            '${dataDetail?['result']['opening_hours']['periods'][0]['close']['time']}'
      });
    } else if (place == "Restaurant") {
      var responseInfo = await http.get(
        detailUrlRestaurant,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore
          .collection('checks')
          .doc('state')
          .update({'placeInfo': '${dataDetail?['result']['sha_detail']}'});
      firestore.collection('checks').doc('state').update({
        'placeOpen':
            '${dataDetail?['result']['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose':
            '${dataDetail?['result']['opening_hours']['periods'][0]['close']['time']}'
      });
    } else if (place == "Park") {
      var responseInfo = await http.get(
        detailUrlPark,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);

        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['place_information']['detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen':
            '${dataDetail?['result']['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose':
            '${dataDetail?['result']['opening_hours']['periods'][0]['close']['time']}'
      });
    } else {
      var responseInfo = await http.get(
        detailUrlCafe,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);

        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['place_information']['detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen':
            '${dataDetail?['result']['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose':
            '${dataDetail?['result']['opening_hours']['periods'][0]['close']['time']}'
      });
    }
    if (detailReload == "False") {
      Future.delayed(Duration(milliseconds: 1), _reloadPage);
    }
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 323,
      decoration: const BoxDecoration(
        color: Styles.bgBackground1,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 70,
                  child: Text(
                    placeName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 35.0, top: 5, bottom: 5, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PartyScreen(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Styles.buttonColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.meeting_room,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "party",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 86,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Open ",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(placeOpen, style: TextStyle(fontSize: 12)),
                        Text(" Close ", style: TextStyle(fontSize: 12)),
                        Text(placeClose, style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 14,
                  child: GestureDetector(
                    onTap: () async {
                      // clickButton();
                      setState(() {
                        check = !check;
                      });

                      final docRef = FirebaseFirestore.instance
                          .collection('users')
                          .doc(loggedInUser.uid);
                      // Retrieve the document and check if the field at index 1 is "True"
                      docRef.get().then((docSnapshot) async {
                        if (docSnapshot.exists) {
                          // Get the value of the field at index 1
                          List<dynamic> field = docSnapshot.data()![placeId];
                          List<dynamic> fieldFavourite =
                              docSnapshot.data()!['favourite'];
                          bool isTrue = field.length >= 1 && field[0] == 'True';
                          String? ff = field[1];
                          // Check if the field at index 1 is "True"
                          if (isTrue) {
                            String? aa = loggedInUser.like;
                            int bb = int.parse(aa!) - 1;
                            String cc = bb.toString();
                            _users.doc(user!.uid).update({"like": cc});

                            _users.doc(loggedInUser.uid).update({
                              placeId: FieldValue.arrayRemove([field[0]]),
                              placeId: FieldValue.arrayRemove([field[1]]),
                            });
                            _users.doc(loggedInUser.uid).update({
                              placeId: FieldValue.arrayUnion(["False", ff]),
                            });

                            for (int num = 0;
                                num < fieldFavourite.length;
                                num++) {
                              if (fieldFavourite[num] == placeId) {
                                _users.doc(loggedInUser.uid).update({
                                  'favourite': FieldValue.arrayRemove(
                                      [fieldFavourite[num]])
                                });
                              }
                            }
                          } else {
                            String? aa = loggedInUser.like;
                            int bb = int.parse(aa!) + 1;
                            String cc = bb.toString();
                            _users.doc(user!.uid).update({"like": cc});

                            _users.doc(loggedInUser.uid).update({
                              placeId: FieldValue.arrayRemove([field[0]]),
                              placeId: FieldValue.arrayRemove([field[1]])
                            });
                            _users.doc(loggedInUser.uid).update({
                              placeId: FieldValue.arrayUnion(["True", ff]),
                            });

                            _users.doc(loggedInUser.uid).update({
                              'favourite': FieldValue.arrayUnion([placeId])
                            });
                            //}
                            //}
                          }
                          _users.doc(loggedInUser.uid).update({
                            placeId: FieldValue.arrayRemove([field[0]])
                          });

                          if (place == "Temple") {
                            await firestoreDocument
                                .collection('temples')
                                .doc(placeId)
                                .update({
                              'Info': FieldValue.arrayUnion([
                                placeClose,
                                placeOpen,
                                placeId,
                                placeInfo,
                                placeName,
                                placeUrl
                              ]),
                            });
                          } else if (place == "Restaurant") {
                            await firestoreDocument
                                .collection('restaurants')
                                .doc(placeId)
                                .update({
                              'Info': FieldValue.arrayUnion([
                                placeClose,
                                placeOpen,
                                placeId,
                                placeInfo,
                                placeName,
                                placeUrl
                              ]),
                            });
                          } else if (place == "Beach") {
                            await firestoreDocument
                                .collection('beaches')
                                .doc(placeId)
                                .update({
                              'Info': FieldValue.arrayUnion([
                                placeClose,
                                placeOpen,
                                placeId,
                                placeInfo,
                                placeName,
                                placeUrl
                              ]),
                            });
                          } else if (place == "Park") {
                            await firestoreDocument
                                .collection('parks')
                                .doc(placeId)
                                .update({
                              'Info': FieldValue.arrayUnion([
                                placeClose,
                                placeOpen,
                                placeId,
                                placeInfo,
                                placeName,
                                placeUrl
                              ]),
                            });
                          } else {
                            await firestoreDocument
                                .collection('cafes')
                                .doc(placeId)
                                .update({
                              'Info': FieldValue.arrayUnion([
                                placeClose,
                                placeOpen,
                                placeId,
                                placeInfo,
                                placeName,
                                placeUrl
                              ]),
                            });
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailScreen(
                                  data: null,
                                ),
                              ));
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 15),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: check == false ? Colors.white : Colors.red,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: Styles.boxShadows,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 15,
                          color: check == false ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 87,
                  child: Row(
                    children: [
                      Text(
                        "tap here to rate: ",
                        style: TextStyle(fontSize: 10),
                      ),
                      RatingBar.builder(
                        initialRating: double.parse(voteRating),
                        minRating: 1,
                        direction: Axis.horizontal,
                        // allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.only(right: 1),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          final docRef = FirebaseFirestore.instance
                              .collection('users')
                              .doc(loggedInUser.uid);
                          // Retrieve the document and check if the field at index 1 is "True"
                          docRef.get().then((docSnapshot) async {
                            if (docSnapshot.exists) {
                              // Get the value of the field at index 1
                              List<dynamic> field =
                                  docSnapshot.data()![placeId];
                              bool isTrue =
                                  field.length >= 1 && field[1] == '-1';
                              if (isTrue) {
                                if (place == "Temple") {
                                  c = countVoteRating;

                                  a = voteRating;

                                  b = (double.parse(a) * int.parse(c)) + rating;
                                  print(b);
                                  d = int.parse(c) + 1;
                                  e = b / d;
                                  f = e.toStringAsFixed(1);
                                  //f = e.toString();
                                  g = d.toString();
                                  print(g);
                                  firestoreDocument
                                      .collection('temples')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  firestoreDocument
                                      .collection('temples')
                                      .doc(placeId)
                                      .update({"countVoteRating": g});
                                  await firestoreDocument
                                      .collection('temples')
                                      .doc(placeId)
                                      .update({
                                    'Info': FieldValue.arrayUnion([
                                      placeClose,
                                      placeOpen,
                                      placeId,
                                      placeInfo,
                                      placeName,
                                      placeUrl
                                    ]),
                                  });
                                } else if (place == "Beach") {
                                  c = countVoteRating;
                                  print(c);
                                  a = voteRating;
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) + rating;
                                  print(b);
                                  d = int.parse(c) + 1;
                                  e = b / d;
                                  f = e.toStringAsFixed(1);
                                  //f = e.toString();
                                  g = d.toString();
                                  print(g);
                                  firestoreDocument
                                      .collection('beaches')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  firestoreDocument
                                      .collection('beaches')
                                      .doc(placeId)
                                      .update({"countVoteRating": g});
                                  await firestoreDocument
                                      .collection('beaches')
                                      .doc(placeId)
                                      .update({
                                    'Info': FieldValue.arrayUnion([
                                      placeClose,
                                      placeOpen,
                                      placeId,
                                      placeInfo,
                                      placeName,
                                      placeUrl
                                    ]),
                                  });
                                } else if (place == "Restaurant") {
                                  c = countVoteRating;
                                  print(c);
                                  a = voteRating;
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) + rating;
                                  print(b);
                                  d = int.parse(c) + 1;
                                  e = b / d;
                                  f = e.toStringAsFixed(1);
                                  //f = e.toString();
                                  g = d.toString();
                                  print(g);
                                  firestoreDocument
                                      .collection('restaurants')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  firestoreDocument
                                      .collection('restaurants')
                                      .doc(placeId)
                                      .update({"countVoteRating": g});
                                  await firestoreDocument
                                      .collection('restaurants')
                                      .doc(placeId)
                                      .update({
                                    'Info': FieldValue.arrayUnion([
                                      placeClose,
                                      placeOpen,
                                      placeId,
                                      placeInfo,
                                      placeName,
                                      placeUrl
                                    ]),
                                  });
                                } else if (place == "Park") {
                                  c = countVoteRating;
                                  print(c);
                                  a = voteRating;
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) + rating;
                                  print(b);
                                  d = int.parse(c) + 1;
                                  e = b / d;
                                  f = e.toStringAsFixed(1);
                                  //f = e.toString();
                                  g = d.toString();
                                  print(g);
                                  firestoreDocument
                                      .collection('parks')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  firestoreDocument
                                      .collection('parks')
                                      .doc(placeId)
                                      .update({"countVoteRating": g});
                                  await firestoreDocument
                                      .collection('parks')
                                      .doc(placeId)
                                      .update({
                                    'Info': FieldValue.arrayUnion([
                                      placeClose,
                                      placeOpen,
                                      placeId,
                                      placeInfo,
                                      placeName,
                                      placeUrl
                                    ]),
                                  });
                                } else {
                                  c = countVoteRating;
                                  print(c);
                                  a = voteRating;
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) + rating;
                                  print(b);
                                  d = int.parse(c) + 1;
                                  e = b / d;
                                  f = e.toStringAsFixed(1);
                                  //f = e.toString();
                                  g = d.toString();
                                  print(g);
                                  firestoreDocument
                                      .collection('cafes')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  firestoreDocument
                                      .collection('cafes')
                                      .doc(placeId)
                                      .update({"countVoteRating": g});
                                  await firestoreDocument
                                      .collection('cafes')
                                      .doc(placeId)
                                      .update({
                                    'Info': FieldValue.arrayUnion([
                                      placeClose,
                                      placeOpen,
                                      placeId,
                                      placeInfo,
                                      placeName,
                                      placeUrl
                                    ]),
                                  });
                                }
                                ab = rating.toString();
                                _users.doc(loggedInUser.uid).update({
                                  placeId: FieldValue.arrayRemove([field[1]])
                                });
                                _users.doc(loggedInUser.uid).update({
                                  placeId: FieldValue.arrayUnion([ab]),
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailScreen(
                                        data: null,
                                      ),
                                    ));
                              } else {
                                print(rating);
                                if (place == "Temple") {
                                  az = field[1];
                                  print("zZZZZZZZz");
                                  print(az);
                                  aaa = double.parse(az);
                                  print("xXXXXX");
                                  print(aaa);
                                  c = countVoteRating;
                                  print("ZZZZZxXXXXX");
                                  print(c);
                                  a = voteRating;
                                  print("ZZZZZxXXXXX");
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) -
                                      aaa +
                                      rating;
                                  print("ZZZZZxXXXXXMMMMM");
                                  print(b);
                                  d = int.parse(c);
                                  e = b / d;
                                  print("WERTT");
                                  print(e);
                                  f = e.toString();
                                  //g = d.toString();
                                  //print(g);
                                  firestoreDocument
                                      .collection('temples')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                  // firestoreDocument
                                  //     .collection('temples')
                                  //     .doc(placeId)
                                  //     .update({"countVoteRating": g});
                                } else if (place == "Beach") {
                                  az = field[1];
                                  print("zZZZZZZZz");
                                  print(az);
                                  aaa = double.parse(az);
                                  print("xXXXXX");
                                  print(aaa);
                                  c = countVoteRating;
                                  print("ZZZZZxXXXXX");
                                  print(c);
                                  a = voteRating;
                                  print("ZZZZZxXXXXX");
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) -
                                      aaa +
                                      rating;
                                  print("ZZZZZxXXXXXMMMMM");
                                  print(b);
                                  d = int.parse(c);
                                  e = b / d;
                                  print("WERTT");
                                  print(e);
                                  f = e.toString();
                                  firestoreDocument
                                      .collection('beaches')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                } else if (place == "Restaurant") {
                                  az = field[1];
                                  print("zZZZZZZZz");
                                  print(az);
                                  aaa = double.parse(az);
                                  print("xXXXXX");
                                  print(aaa);
                                  c = countVoteRating;
                                  print("ZZZZZxXXXXX");
                                  print(c);
                                  a = voteRating;
                                  print("ZZZZZxXXXXX");
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) -
                                      aaa +
                                      rating;
                                  print("ZZZZZxXXXXXMMMMM");
                                  print(b);
                                  d = int.parse(c);
                                  e = b / d;
                                  print("WERTT");
                                  print(e);
                                  f = e.toString();
                                  firestoreDocument
                                      .collection('restaurants')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                } else if (place == "Park") {
                                  az = field[1];
                                  print("zZZZZZZZz");
                                  print(az);
                                  aaa = double.parse(az);
                                  print("xXXXXX");
                                  print(aaa);
                                  c = countVoteRating;
                                  print("ZZZZZxXXXXX");
                                  print(c);
                                  a = voteRating;
                                  print("ZZZZZxXXXXX");
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) -
                                      aaa +
                                      rating;
                                  print("ZZZZZxXXXXXMMMMM");
                                  print(b);
                                  d = int.parse(c);
                                  e = b / d;
                                  print("WERTT");
                                  print(e);
                                  f = e.toString();
                                  firestoreDocument
                                      .collection('parks')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                } else {
                                  az = field[1];
                                  print("zZZZZZZZz");
                                  print(az);
                                  aaa = double.parse(az);
                                  print("xXXXXX");
                                  print(aaa);
                                  c = countVoteRating;
                                  print("ZZZZZxXXXXX");
                                  print(c);
                                  a = voteRating;
                                  print("ZZZZZxXXXXX");
                                  print(a);
                                  b = (double.parse(a) * int.parse(c)) -
                                      aaa +
                                      rating;
                                  print("ZZZZZxXXXXXMMMMM");
                                  print(b);
                                  d = int.parse(c);
                                  e = b / d;
                                  print("WERTT");
                                  print(e);
                                  f = e.toString();
                                  firestoreDocument
                                      .collection('cafes')
                                      .doc(placeId)
                                      .update({"voteRating": f});
                                }
                                abc = rating.toString();
                                _users.doc(loggedInUser.uid).update({
                                  placeId: FieldValue.arrayRemove([field[1]])
                                });
                                _users.doc(loggedInUser.uid).update({
                                  placeId: FieldValue.arrayUnion([abc]),
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailScreen(
                                        data: null,
                                      ),
                                    ));
                              }
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_sharp,
                        size: 15,
                        color: Colors.amber,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          voteRating,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "________________________",
                    style: TextStyle(color: Colors.grey),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        placeInfo,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Padding(
//       padding: const EdgeInsets.only(right: 10.0),
//       child: Text(
//         placeInfo,
//         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//       ),
//     ),
//   ],
// )
