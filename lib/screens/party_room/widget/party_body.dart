import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controllers/user_model.dart';
import '../party_screen.dart';

class PartyBody extends StatefulWidget {
  const PartyBody({Key? key}) : super(key: key);

  @override
  State<PartyBody> createState() => _PartyBodyState();
}

class _PartyBodyState extends State<PartyBody> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference checkCollection =
      FirebaseFirestore.instance.collection('checks');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final FirebaseFirestore firestoreDocument = FirebaseFirestore.instance;

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  List<MapEntry<String, dynamic>> dataList = [];
  int dataCheck = 0;
  int dataLength = 0;
  int dataValueLength = 0;
  String formattedDateTime = '';
  int countJoined = 0;
  String usernameJoin = '';
  String describeJoin = '';
  String instagramJoin = '';
  String facebookJoin = '';
  String lineJoin = '';
  String createCountJoin = '';
  String joinCountJoin = '';
  String likeJoin = '';
  String imageJoin = '';
  String joinCount = '';

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
      });
    }
  }

  int loopUser = 6;
  List colorUser = [
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.red,
  ];

  Future<void> fetchTempleData(String placeId) async {
    if (place == "Temple") {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('temples')
          .doc(placeId)
          .get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic>? data = snapshot.data();
          data?.remove('Info');
          data?.remove('countVoteRating');
          data?.remove('voteRating');

          dataList = data?.entries.toList() ?? [];
          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm a').format(now);
            DateTime timeNow = DateFormat('hh:mm a').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm a').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    } else if (place == "Restaurant") {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('restaurants')
          .doc(placeId)
          .get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic>? data = snapshot.data();
          data?.remove('Info');
          data?.remove('countVoteRating');
          data?.remove('voteRating');

          dataList = data?.entries.toList() ?? [];

          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm a').format(now);
            DateTime timeNow = DateFormat('hh:mm a').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm a').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    } else if (place == "Beach") {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('beaches')
          .doc(placeId)
          .get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic>? data = snapshot.data();
          data?.remove('Info');
          data?.remove('countVoteRating');
          data?.remove('voteRating');

          dataList = data?.entries.toList() ?? [];

          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm a').format(now);
            DateTime timeNow = DateFormat('hh:mm a').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm a').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    } else if (place == "Park") {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('parks')
          .doc(placeId)
          .get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic>? data = snapshot.data();
          data?.remove('Info');
          data?.remove('countVoteRating');
          data?.remove('voteRating');

          dataList = data?.entries.toList() ?? [];

          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm a').format(now);
            DateTime timeNow = DateFormat('hh:mm a').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm a').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    } else {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('cafes')
          .doc(placeId)
          .get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic>? data = snapshot.data();
          data?.remove('Info');
          data?.remove('countVoteRating');
          data?.remove('voteRating');

          dataList = data?.entries.toList() ?? [];

          dataCheck = dataList.length;

          for (int i = dataCheck - 1; i >= 0; i--) {
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm a').format(now);
            DateTime timeNow = DateFormat('hh:mm a').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm a').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(const Duration(milliseconds: 900), () {
      fetchTempleData(placeId);
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return dataLength > 0
        ? GridView.count(
            childAspectRatio: 1.9,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            shrinkWrap: true,
            children: [
              for (int num = 0; num < dataLength; num++)
                Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 20),
                    child: Container(
                      width: 315,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: Styles.boxShadows,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15.0, left: 30),
                                child: dataList[num].value[7] ==
                                        loggedInUser.uid
                                    ? GestureDetector(
                                        onTap: () async {
                                          //
                                          if (place == "Temple") {
                                            await firestoreDocument
                                                .collection('temples')
                                                .doc(placeId)
                                                .update({
                                              dataList[num].value[6]:
                                                  FieldValue.delete(),
                                            });
                                            await _users.doc(user!.uid).update({
                                              "create": FieldValue.arrayRemove(
                                                  [dataList[num].value[6]]),
                                            });
                                            for (int xx = 8;
                                                xx < dataList[num].value.length;
                                                xx++) {
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({
                                                "join": FieldValue.arrayRemove(
                                                    [dataList[num].value[6]]),
                                              });
                                              final DocumentSnapshot
                                                  snapshotUser =
                                                  await userCollection
                                                      .doc(dataList[num]
                                                          .value[xx])
                                                      .get();
                                              if (snapshotUser.exists) {
                                                setState(() {
                                                  joinCount = snapshotUser
                                                      .get('joinCount');
                                                });
                                              }
                                              String ab = joinCount;
                                              int abb = int.parse(ab!) - 1;
                                              String abc = abb.toString();
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({"joinCount": abc});
                                            }
                                          } else if (place == "Restaurant") {
                                            await firestoreDocument
                                                .collection('restaurants')
                                                .doc(placeId)
                                                .update({
                                              dataList[num].value[6]:
                                                  FieldValue.delete(),
                                            });
                                            await _users.doc(user!.uid).update({
                                              "create": FieldValue.arrayRemove(
                                                  [dataList[num].value[6]]),
                                            });
                                            for (int xx = 8;
                                                xx < dataList[num].value.length;
                                                xx++) {
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({
                                                "join": FieldValue.arrayRemove(
                                                    [dataList[num].value[6]]),
                                              });
                                              final DocumentSnapshot
                                                  snapshotUser =
                                                  await userCollection
                                                      .doc(dataList[num]
                                                          .value[xx])
                                                      .get();
                                              if (snapshotUser.exists) {
                                                setState(() {
                                                  joinCount = snapshotUser
                                                      .get('joinCount');
                                                });
                                              }
                                              String ab = joinCount;
                                              int abb = int.parse(ab!) - 1;
                                              String abc = abb.toString();
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({"joinCount": abc});
                                            }
                                          } else if (place == "Beach") {
                                            await firestoreDocument
                                                .collection('beaches')
                                                .doc(placeId)
                                                .update({
                                              dataList[num].value[6]:
                                                  FieldValue.delete(),
                                            });
                                            await _users.doc(user!.uid).update({
                                              "create": FieldValue.arrayRemove(
                                                  [dataList[num].value[6]]),
                                            });
                                            for (int xx = 8;
                                                xx < dataList[num].value.length;
                                                xx++) {
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({
                                                "join": FieldValue.arrayRemove(
                                                    [dataList[num].value[6]]),
                                              });
                                              final DocumentSnapshot
                                                  snapshotUser =
                                                  await userCollection
                                                      .doc(dataList[num]
                                                          .value[xx])
                                                      .get();
                                              if (snapshotUser.exists) {
                                                setState(() {
                                                  joinCount = snapshotUser
                                                      .get('joinCount');
                                                });
                                              }
                                              String ab = joinCount;
                                              int abb = int.parse(ab!) - 1;
                                              String abc = abb.toString();
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({"joinCount": abc});
                                            }
                                          } else if (place == "Park") {
                                            await firestoreDocument
                                                .collection('parks')
                                                .doc(placeId)
                                                .update({
                                              dataList[num].value[6]:
                                                  FieldValue.delete(),
                                            });
                                            await _users.doc(user!.uid).update({
                                              "create": FieldValue.arrayRemove(
                                                  [dataList[num].value[6]]),
                                            });
                                            for (int xx = 8;
                                                xx < dataList[num].value.length;
                                                xx++) {
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({
                                                "join": FieldValue.arrayRemove(
                                                    [dataList[num].value[6]]),
                                              });
                                              final DocumentSnapshot
                                                  snapshotUser =
                                                  await userCollection
                                                      .doc(dataList[num]
                                                          .value[xx])
                                                      .get();
                                              if (snapshotUser.exists) {
                                                setState(() {
                                                  joinCount = snapshotUser
                                                      .get('joinCount');
                                                });
                                              }
                                              String ab = joinCount;
                                              int abb = int.parse(ab!) - 1;
                                              String abc = abb.toString();
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({"joinCount": abc});
                                            }
                                          } else {
                                            await firestoreDocument
                                                .collection('cafes')
                                                .doc(placeId)
                                                .update({
                                              dataList[num].value[6]:
                                                  FieldValue.delete(),
                                            });
                                            await _users.doc(user!.uid).update({
                                              "create": FieldValue.arrayRemove(
                                                  [dataList[num].value[6]]),
                                            });
                                            for (int xx = 8;
                                                xx < dataList[num].value.length;
                                                xx++) {
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({
                                                "join": FieldValue.arrayRemove(
                                                    [dataList[num].value[6]]),
                                              });
                                              final DocumentSnapshot
                                                  snapshotUser =
                                                  await userCollection
                                                      .doc(dataList[num]
                                                          .value[xx])
                                                      .get();
                                              if (snapshotUser.exists) {
                                                setState(() {
                                                  joinCount = snapshotUser
                                                      .get('joinCount');
                                                });
                                              }
                                              String ab = joinCount;
                                              int abb = int.parse(ab!) - 1;
                                              String abc = abb.toString();
                                              await firestoreDocument
                                                  .collection('users')
                                                  .doc(dataList[num].value[xx])
                                                  .update({"joinCount": abc});
                                            }
                                          }
                                          final String? a =
                                              loggedInUser.createCount;
                                          int b = int.parse(a!) - 1;
                                          String c = b.toString();
                                          await _users
                                              .doc(user!.uid)
                                              .update({"createCount": c});

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PartyScreen(),
                                              ));
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              boxShadow: Styles.boxShadows,
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.restore_from_trash,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          color: Colors.transparent,
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 210),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20.0, right: 15),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (dataList[num].value.length - 8 >
                                        dataList[num].value[4]) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Alert"),
                                            content: const Text(
                                                "This room is Full. You can create a new one"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      if (loggedInUser.uid ==
                                          dataList[num].value[7]) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Alert"),
                                              content: const Text(
                                                  "You are Owner Room"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("OK"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        for (int xx = 8;
                                            xx < dataList[num].value.length;
                                            xx++) {
                                          if (loggedInUser.uid ==
                                              dataList[num].value[xx]) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text("Alert"),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const [
                                                      Text(
                                                          "You have already joined."),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        "Do you want to leave this Party?",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        if (place == "Temple") {
                                                          await firestoreDocument
                                                              .collection(
                                                                  'temples')
                                                              .doc(placeId)
                                                              .update({
                                                            dataList[num]
                                                                    .value[6]:
                                                                FieldValue
                                                                    .arrayRemove([
                                                              loggedInUser.uid
                                                            ]),
                                                          });
                                                        } else if (place ==
                                                            "Restaurant") {
                                                          await firestoreDocument
                                                              .collection(
                                                                  'restaurants')
                                                              .doc(placeId)
                                                              .update({
                                                            dataList[num]
                                                                    .value[6]:
                                                                FieldValue
                                                                    .arrayRemove([
                                                              loggedInUser.uid
                                                            ]),
                                                          });
                                                        } else if (place ==
                                                            "Beach") {
                                                          await firestoreDocument
                                                              .collection(
                                                                  'beaches')
                                                              .doc(placeId)
                                                              .update({
                                                            dataList[num]
                                                                    .value[6]:
                                                                FieldValue
                                                                    .arrayRemove([
                                                              loggedInUser.uid
                                                            ]),
                                                          });
                                                        } else if (place ==
                                                            "Park") {
                                                          await firestoreDocument
                                                              .collection(
                                                                  'parks')
                                                              .doc(placeId)
                                                              .update({
                                                            dataList[num]
                                                                    .value[6]:
                                                                FieldValue
                                                                    .arrayRemove([
                                                              loggedInUser.uid
                                                            ]),
                                                          });
                                                        } else {
                                                          await firestoreDocument
                                                              .collection(
                                                                  'cafes')
                                                              .doc(placeId)
                                                              .update({
                                                            dataList[num]
                                                                    .value[6]:
                                                                FieldValue
                                                                    .arrayRemove([
                                                              loggedInUser.uid
                                                            ]),
                                                          });
                                                        }
                                                        String? j = loggedInUser
                                                            .joinCount;
                                                        int jj =
                                                            int.parse(j!) - 1;
                                                        String jjj =
                                                            jj.toString();
                                                        await _users
                                                            .doc(user!.uid)
                                                            .update({
                                                          "joinCount": jjj
                                                        });
                                                        await _users
                                                            .doc(user!.uid)
                                                            .update({
                                                          "join": FieldValue
                                                              .arrayRemove([
                                                            dataList[num]
                                                                .value[6]
                                                          ]),
                                                        });
                                                        // Handle leave action here
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const PartyScreen(),
                                                            ));
                                                      },
                                                      child: const Text(
                                                        "Leave",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            countJoined++;
                                          }
                                        }
                                        if (countJoined ==
                                            dataList[num].value.length - 8) {
                                          final String? a =
                                              loggedInUser.joinCount;
                                          int b = int.parse(a!) + 1;
                                          String c = b.toString();
                                          await _users
                                              .doc(user!.uid)
                                              .update({"joinCount": c});

                                          await _users.doc(user!.uid).update({
                                            "join": FieldValue.arrayUnion(
                                                [dataList[num].value[6]])
                                          });
                                          if (place == "Temple") {
                                            await FirebaseFirestore.instance
                                                .collection('temples')
                                                .doc(placeId)
                                              ..update({
                                                dataList[num].value[6]:
                                                    FieldValue.arrayUnion(
                                                        [loggedInUser.uid])
                                              });
                                          } else if (place == "Restaurant") {
                                            await FirebaseFirestore.instance
                                                .collection('restaurants')
                                                .doc(placeId)
                                              ..update({
                                                dataList[num].value[6]:
                                                    FieldValue.arrayUnion(
                                                        [loggedInUser.uid])
                                              });
                                          } else if (place == "Beach") {
                                            await FirebaseFirestore.instance
                                                .collection('beaches')
                                                .doc(placeId)
                                              ..update({
                                                dataList[num].value[6]:
                                                    FieldValue.arrayUnion(
                                                        [loggedInUser.uid])
                                              });
                                          } else if (place == "Park") {
                                            await FirebaseFirestore.instance
                                                .collection('parks')
                                                .doc(placeId)
                                              ..update({
                                                dataList[num].value[6]:
                                                    FieldValue.arrayUnion(
                                                        [loggedInUser.uid])
                                              });
                                          } else {
                                            await FirebaseFirestore.instance
                                                .collection('cafes')
                                                .doc(placeId)
                                              ..update({
                                                dataList[num].value[6]:
                                                    FieldValue.arrayUnion(
                                                        [loggedInUser.uid])
                                              });
                                          }
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("Alert"),
                                                content: const Text("Joining"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const PartyScreen(),
                                                          ));
                                                    },
                                                    child: const Text("OK"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Styles.buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        Icon(
                                          Icons.input,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "Join",
                                          style: GoogleFonts.deliusUnicase(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 30),
                                  child: Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(placeUrl),
                                          fit: BoxFit.fill),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: Styles.boxShadows,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat.yMMMMd().format(
                                          dataList[num].value[0].toDate()),
                                      //"30 October",
                                        style: GoogleFonts.deliusUnicase(
                                          fontSize: 18,
                                        ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Time ",
                                          style: GoogleFonts.deliusUnicase(
                                              fontSize: 18,
                                              ), //Textstyle
                                        ),
                                        Text(dataList[num].value[1] +
                                            "-" +
                                            dataList[num].value[2]),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      dataList[num].value[5],
                                      style: GoogleFonts.deliusUnicase(
                                        fontSize: 8,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 265,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12.0, left: 25),
                                  child: Row(
                                    children: [
                                      for (int count = 0;
                                          count <
                                              dataList[num].value.length - 7;
                                          count++)
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(dataList[num]
                                                      .value[count + 7])
                                                  .get()
                                                  .then((DocumentSnapshot
                                                      documentSnapshot) {
                                                usernameJoin = documentSnapshot
                                                    .get('username');
                                                describeJoin = documentSnapshot
                                                    .get('describe');
                                                instagramJoin = documentSnapshot
                                                    .get('instagram');
                                                facebookJoin = documentSnapshot
                                                    .get('facebook');
                                                lineJoin = documentSnapshot
                                                    .get('line');
                                                createCountJoin =
                                                    documentSnapshot
                                                        .get('createCount');
                                                joinCountJoin = documentSnapshot
                                                    .get('joinCount');
                                                likeJoin = documentSnapshot
                                                    .get('like');
                                                imageJoin = documentSnapshot
                                                    .get('image');
                                              });
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Card(
                                                    elevation: 50,
                                                    shadowColor: Colors.black,
                                                    color: Styles.bgBackground,
                                                    child: SizedBox(
                                                      width: 10,
                                                      height: 250,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Styles
                                                                      .buttonColor,
                                                              radius: 108,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        imageJoin),
                                                                //NetworkImage
                                                                radius: 100,
                                                              ), //CircleAvatar
                                                            ), //CircleAvatar
                                                            const SizedBox(
                                                              height: 10,
                                                            ), //SizedBox
                                                            count == dataList[num].value.length -8?Text(
                                                              'Participant',
                                                              style: TextStyle(
                                                                fontSize: 30,
                                                                color: Colors
                                                                    .green[900],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ), //Textstyle
                                                            ):Text(
                                                              'Owner',
                                                              style: TextStyle(
                                                                fontSize: 30,
                                                                color: Colors
                                                                    .green[900],
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ), //Textstyle
                                                            ), //Text
                                                            const SizedBox(
                                                              height: 10,
                                                            ), //SizedBox
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        usernameJoin,
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Styles.buttonColor,
                                                                        ), //Textstyle
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        describeJoin,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              Styles.buttonColor,
                                                                        ), //Textstyle
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Image
                                                                          .asset(
                                                                        "assets/icons/instagram.png",
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      onPressed:
                                                                          () async {},
                                                                    ),
                                                                    Text(
                                                                      "Instagram: ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                    Text(
                                                                      instagramJoin,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Image
                                                                          .asset(
                                                                        "assets/icons/facebook.png",
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      onPressed:
                                                                          () async {},
                                                                    ),
                                                                    Text(
                                                                      "Facebook: ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                    Text(
                                                                      facebookJoin,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Image
                                                                          .asset(
                                                                        "assets/icons/line.png",
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      onPressed:
                                                                          () async {},
                                                                    ),
                                                                    Text(
                                                                      "Line: ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                    Text(
                                                                      lineJoin,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Styles
                                                                            .buttonColor,
                                                                      ), //Textstyle
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ), //Text
                                                            const SizedBox(
                                                              height: 10,
                                                            ), //SizedBox
                                                            SizedBox(
                                                              width: 100,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Styles.buttonColor)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(4),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .touch_app),
                                                                      Text('OK')
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ) //SizedBox
                                                          ],
                                                        ), //Column
                                                      ), //Padding
                                                    ), //SizedBox
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: colorUser[count],
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                boxShadow: Styles.boxShadows,
                                              ),
                                              child: const Icon(
                                                Icons.person_2_outlined,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: dataList[num].value[3] == "Boy"
                                              ? Colors.blueAccent
                                              : dataList[num].value[3] == "Girl"
                                                  ? Colors.pinkAccent
                                                  : Colors.purpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            dataList[num].value[3],
                                            style: GoogleFonts.deliusUnicase(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        "${dataList[num].value.length - 8}" +
                                            "/" +
                                            dataList[num].value[4].toString(),
                                        style: const TextStyle(fontSize: 10)),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.0, bottom: 2),
                                      child: Icon(
                                        Icons.person,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
            ],
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            height: 450,
            width: 400,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      "assets/icons/dance.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No party room!",
                        style: GoogleFonts.deliusUnicase(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("Let's create party",
                        style: GoogleFonts.deliusUnicase(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ));
  }
}
