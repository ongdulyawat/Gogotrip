import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/party_room/party_screen.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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

  final CollectionReference checkCollection = FirebaseFirestore.instance.collection('checks');
  final CollectionReference templeRating = FirebaseFirestore.instance.collection('temples');
  final CollectionReference restaurantRating = FirebaseFirestore.instance.collection('restaurant');
  final CollectionReference beachRating = FirebaseFirestore.instance.collection('beaches');
  final CollectionReference parkRating = FirebaseFirestore.instance.collection('parks');
  final CollectionReference cafeRating= FirebaseFirestore.instance.collection('cafes');

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
  String a = '';
  double b = 0;
  String c = '';
  int d = 0;
  double e = 0;
  String f = '';
  String g = '';
  double rating = 0;
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
  getDataFromRating() async {
    if (place == "Temple") {
      final DocumentSnapshot getTempleRating = await templeRating.doc(placeId)
          .get();
      if (getTempleRating.exists) {
        setState(() {
          countVoteRating = getTempleRating.get('countVoteRating');
          voteRating = getTempleRating.get('voteRating');
        });
      }
    }
    else if (place == "Beach") {
      final DocumentSnapshot getBeachRating = await beachRating.doc(placeId)
          .get();
      if (getBeachRating.exists) {
        setState(() {
          countVoteRating = getBeachRating.get('countVoteRating');
          voteRating = getBeachRating.get('voteRating');
        });
      }
    }
    else if (place == "Restaurant") {
      final DocumentSnapshot getRestaurantRating = await restaurantRating.doc(
          placeId).get();
      if (getRestaurantRating.exists) {
        setState(() {
          countVoteRating = getRestaurantRating.get('countVoteRating');
          voteRating = getRestaurantRating.get('voteRating');
        });
      }
    }
    else if (place == "Parks") {
      final DocumentSnapshot getParkRating = await parkRating.doc(placeId)
          .get();
      if (getParkRating.exists) {
        setState(() {
          countVoteRating = getParkRating.get('countVoteRating');
          voteRating = getParkRating.get('voteRating');
        });
      }
    }
    else {
      final DocumentSnapshot getCafeRating = await cafeRating.doc(placeId)
          .get();
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
        print('Document already exists!');
      }
      else {
        firestoreDocument.collection('temples').doc(placeId).set(
            {"voteRating": "0", "countVoteRating": "0"});
        print('Document does not exist!');
      }
    }
    else if (place == "Beach") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('beaches')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        firestoreDocument.collection('beaches').doc(placeId).set(
            {"voteRating": "0", "countVoteRating": "0"});
        print('Document does not exist!');
      }
    }
    else if (place == "Restaurant") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('restaurants')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        firestoreDocument.collection('restaurants').doc(placeId).set(
            {"voteRating": "0", "countVoteRating": "0"});
        print('Document does not exist!');
      }
    }
    else if (place == "Park") {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('parks')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        firestoreDocument.collection('parks').doc(placeId).set(
            {"voteRating": "0", "countVoteRating": "0"});
        print('Document does not exist!');
      }
    }
    else {
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('cafes')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        firestoreDocument.collection('cafes').doc(placeId).set(
            {"voteRating": "0", "countVoteRating": "0"});
        print('Document does not exist!');
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
    // if(detailReload == "False" && detailReload == ''){
    //   Future.delayed(Duration(seconds: 5), _reloadPage);
    //   print("xxxx"+detailReload);
    // }

  }
  void _reloadPage() {
    firestore.collection('checks').doc('state').update({
      'detailReload': 'True'
    });
    // Use the Navigator class to reload the current page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => DetailScreen(
        data: null,
      ),),
    );
    print("WWWWWWWWW"+detailReload);
  }

  Future<String> getData() async {
    final String apiKey = await
    "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
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
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/'+placeId);
    var detailUrlTemple = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/'+placeId);
    var detailUrlRestaurant = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/'+placeId);
    var detailUrlPark = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/'+placeId);
    var detailUrlCafe = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/restaurant/'+placeId);

    //print("Test"+widget.locations);
    //print("HelloTest"+place);
    if (place == "Temple") {

      var responseInfo = await http.get(
        detailUrlTemple,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }

      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['place_information']['detail']}'
      });

      firestore.collection('checks').doc('state').update({
        'placeOpen': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['close']['time']}'
      });

    }

    else if ( place == "Beach") {

      var responseInfo = await http.get(
        detailUrlBeach,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['sha_detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['close']['time']}'
      });
    }


    else if ( place == "Restaurant") {
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
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']['sha_detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['close']['time']}'
      });
    }

    else if ( place == "Park") {
      var responseInfo = await http.get(
        detailUrlPark,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']
        ['place_information']['detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['close']['time']}'
      });
    }

    else{
      var responseInfo = await http.get(
        detailUrlCafe,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
      firestore.collection('checks').doc('state').update({
        'placeInfo': '${dataDetail?['result']
        ['place_information']['detail']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeOpen': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['open']['time']}'
      });
      firestore.collection('checks').doc('state').update({
        'placeClose': '${dataDetail?['result']
        ['opening_hours']['periods'][0]['close']['time']}'
      });
    }
    if(detailReload == "False" ){
      Future.delayed(Duration(milliseconds: 1), _reloadPage);
      print("xxxx"+detailReload);
    }
    return "success";

  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // if(place == "Temple"){
    //   //print(placeId);
    //   print("xxxxx"+dataDetail?['result']['place_information']['detail']);
    //
    //   firestore.collection('checks').doc('state').update({
    //     'placeInfo': '${dataDetail?['result']['place_information']['detail']}'
    //   });
    //
    //   firestore.collection('checks').doc('state').update({
    //     'placeOpen': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['open']['time']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeClose': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['close']['time']}'
    //   });
    // }
    //
    //
    // else if (place == "Beach") {
    //   firestore.collection('checks').doc('state').update({
    //     'placeInfo': '${dataDetail?['result']['sha_detail']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeOpen': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['open']['time']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeClose': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['close']['time']}'
    //   });
    // }
    //
    // else if (place == "Restaurant") {
    //   firestore.collection('checks').doc('state').update({
    //     'placeInfo': '${dataDetail?['result']['sha_detail']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeOpen': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['open']['time']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeClose': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['close']['time']}'
    //   });
    // }
    //
    // else if (place == "Park") {
    //   firestore.collection('checks').doc('state').update({
    //     'placeInfo': '${dataDetail?['result']
    //     ['place_information']['detail']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeOpen': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['open']['time']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeClose': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['close']['time']}'
    //   });
    // }
    // else {
    //   firestore.collection('checks').doc('state').update({
    //     'placeInfo': '${dataDetail?['result']
    //     ['place_information']['detail']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeOpen': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['open']['time']}'
    //   });
    //   firestore.collection('checks').doc('state').update({
    //     'placeClose': '${dataDetail?['result']
    //     ['opening_hours']['periods'][0]['close']['time']}'
    //   });
    // }
    return Container(
      width: 378,
      height: 323,
      decoration: const BoxDecoration(
        color: Colors.white,
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
                  child: Row(
                    children:  [
                      Icon(
                        Icons.star_rate_sharp,
                        size: 15,
                        color: Colors.amber,
                      ),
                      // SizedBox(width: 2),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(voteRating,
                          //"4.0",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
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
                    print(rating);
                    if(place == "Temple"){
                      c = countVoteRating;
                      print(c);
                      a = voteRating;
                      print(a);
                      b = (double.parse(a)*int.parse(c))+rating;
                      print(b);
                      d = int.parse(c) + 1;
                      e = b/d;
                      f = e.toString();
                      g = d.toString();
                      print(g);
                      firestoreDocument.collection('temples').doc(placeId).update({"voteRating": f});
                      firestoreDocument.collection('temples').doc(placeId).update({"countVoteRating": g});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DetailScreen(
                              data: null,
                            ),
                          ));
                    }
                    else if(place == "Beach"){
                      c = countVoteRating;
                      print(c);
                      a = voteRating;
                      print(a);
                      b = (double.parse(a)*int.parse(c))+rating;
                      print(b);
                      d = int.parse(c) + 1;
                      e = b/d;
                      f = e.toString();
                      g = d.toString();
                      print(g);
                      firestoreDocument.collection('beaches').doc(placeId).update({"voteRating": f});
                      firestoreDocument.collection('beaches').doc(placeId).update({"countVoteRating": g});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DetailScreen(
                              data: null,
                            ),
                          ));
                    }
                    else if(place == "Restaurant"){
                      c = countVoteRating;
                      print(c);
                      a = voteRating;
                      print(a);
                      b = (double.parse(a)*int.parse(c))+rating;
                      print(b);
                      d = int.parse(c) + 1;
                      e = b/d;
                      f = e.toString();
                      g = d.toString();
                      print(g);
                      firestoreDocument.collection('restaurants').doc(placeId).update({"voteRating": f});
                      firestoreDocument.collection('restaurants').doc(placeId).update({"countVoteRating": g});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DetailScreen(
                              data: null,
                            ),
                          ));
                    }
                    else if(place == "Parks"){
                      c = countVoteRating;
                      print(c);
                      a = voteRating;
                      print(a);
                      b = (double.parse(a)*int.parse(c))+rating;
                      print(b);
                      d = int.parse(c) + 1;
                      e = b/d;
                      f = e.toString();
                      g = d.toString();
                      print(g);
                      firestoreDocument.collection('parks').doc(placeId).update({"voteRating": f});
                      firestoreDocument.collection('parks').doc(placeId).update({"countVoteRating": g});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DetailScreen(
                              data: null,

                            ),
                          ));
                    }
                    else{
                      c = countVoteRating;
                      print(c);
                      a = voteRating;
                      print(a);
                      b = (double.parse(a)*int.parse(c))+rating;
                      print(b);
                      d = int.parse(c) + 1;
                      e = b/d;
                      f = e.toString();
                      g = d.toString();
                      print(g);
                      firestoreDocument.collection('cafes').doc(placeId).update({"voteRating": f});
                      firestoreDocument.collection('cafes').doc(placeId).update({"countVoteRating": g});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const DetailScreen(
                              data: null,
                            ),
                          ));
                    }
                  },
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  placeInfo,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
