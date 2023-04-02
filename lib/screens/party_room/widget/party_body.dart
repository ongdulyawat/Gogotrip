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

  //Map data = [];
  //List testList = [];

  //int datalength = 4;

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

  int loopUser = 6;
  List colorUser = [
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.red,
  ];

  // getPlace(){
  //   if(place == "Temple"){
  //     final CollectionReference<Map<String, dynamic>> placeCollection =
  //     FirebaseFirestore.instance.collection('temples');
  //   }
  //   else if(place == "Restaurant"){
  //     final CollectionReference<Map<String, dynamic>> placeCollection =
  //     FirebaseFirestore.instance.collection('restaurants');
  //   }
  //   else if(place == "Beach"){
  //     final CollectionReference<Map<String, dynamic>> placeCollection =
  //     FirebaseFirestore.instance.collection('beaches');
  //   }
  //   else if(place == "Park"){
  //     final CollectionReference<Map<String, dynamic>> placeCollection =
  //     FirebaseFirestore.instance.collection('parks');
  //   }
  //   else{
  //     final CollectionReference<Map<String, dynamic>> placeCollection =
  //     FirebaseFirestore.instance.collection('cafes');
  //   }
  // }

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
          print(data);

          dataList = data?.entries.toList() ?? [];
          // print("Show Field"); // remove the Info field
          // print(data);
          // print(data!.length);
          // print(data!['6z2d6PTPOW'][0]);
          //dataList = data?.entries.toList() ?? [];
          print("Show Field");
          print(dataList);
          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            // print("New I");
            // for(int j = 0; j < dataList[i].value.length; j++){
            //   print(dataList[i].value[j]);
            //   print("Finish J");
            // }
            print("New I");
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm').format(now);
            DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                print("Same day but furture");
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              print("Furture");
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
          print(data);

          dataList = data?.entries.toList() ?? [];
          print("Show Field");
          print(dataList);
          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            // print("New I");
            // for(int j = 0; j < dataList[i].value.length; j++){
            //   print(dataList[i].value[j]);
            //   print("Finish J");
            // }
            print("New I");
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm').format(now);
            DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                print("Same day but furture");
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              print("Furture");
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
          print(data);

          dataList = data?.entries.toList() ?? [];
          print("Show Field");
          print(dataList);
          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            // print("New I");
            // for(int j = 0; j < dataList[i].value.length; j++){
            //   print(dataList[i].value[j]);
            //   print("Finish J");
            // }
            print("New I");
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm').format(now);
            DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                print("Same day but furture");
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              print("Furture");
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
          print(data);

          dataList = data?.entries.toList() ?? [];
          print("Show Field");
          print(dataList);
          dataCheck = dataList.length;
          for (int i = dataCheck - 1; i >= 0; i--) {
            // print("New I");
            // for(int j = 0; j < dataList[i].value.length; j++){
            //   print(dataList[i].value[j]);
            //   print("Finish J");
            // }
            print("New I");
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm').format(now);
            DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                print("Same day but furture");
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              print("Furture");
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
          print(data);

          dataList = data?.entries.toList() ?? [];
          print("Show Field");
          print(dataList);
          dataCheck = dataList.length;
          //dataList.removeAt(1);
          for (int i = dataCheck - 1; i >= 0; i--) {
            print("New I");
            DateTime now = DateTime.now();
            String formattedTime = DateFormat('h:mm').format(now);
            DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

            DateTime timestamp = dataList[i].value[0].toDate();
            DateTime parsedTime =
                DateFormat('h:mm').parse(dataList[i].value[2]);

            if (timestamp.year == now.year &&
                timestamp.month == now.month &&
                timestamp.day == now.day) {
              if (parsedTime.isBefore(timeNow)) {
                print("Same day but furture");
                dataList.removeAt(i);
              }
            } else if (timestamp.isBefore(now)) {
              print("Furture");
              dataList.removeAt(i);
            }
          }
        });
      }
      dataLength = dataList.length;
    }
  }

  // final CollectionReference<Map<String, dynamic>> placeCollection =
  // FirebaseFirestore.instance.collection('temples');

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
    return GridView.count(
      childAspectRatio: 1.9,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int num = 0; num < dataLength; num++)
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
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
                        padding: const EdgeInsets.only(top: 15.0, left: 30),
                        child: dataList[num].value[7] == loggedInUser.uid
                            ? GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: Styles.boxShadows,
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: const EdgeInsets.only(top: 20.0, right: 15),
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
                              if (loggedInUser.uid == dataList[num].value[7]) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Alert"),
                                      content: const Text("You are Owner Room"),
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
                                          content: const Text(
                                              "You have been joined already"),
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
                                    countJoined++;
                                  }
                                }
                                if (countJoined ==
                                    dataList[num].value.length - 8) {
                                  final String? a = loggedInUser.joinCount;
                                  int b = int.parse(a!) + 1;
                                  String c = b.toString();
                                  await _users
                                      .doc(user!.uid)
                                      .update({"joinCount": c});
                                  print("Joining");
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
                                              print("Joining");
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
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.input,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "Join",
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
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 30),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.yMMMMd()
                                  .format(dataList[num].value[0].toDate()),
                              //"30 October",
                              style: GoogleFonts.bebasNeue(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time ",
                                  style: GoogleFonts.bebasNeue(fontSize: 20),
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
                              style: GoogleFonts.poppins(fontSize: 10),
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
                                  count < dataList[num].value.length - 8;
                                  count++)
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(dataList[num].value[count + 8])
                                          .get()
                                          .then((DocumentSnapshot
                                              documentSnapshot) {
                                        usernameJoin =
                                            documentSnapshot.get('username');
                                        describeJoin =
                                            documentSnapshot.get('describe');
                                        instagramJoin =
                                            documentSnapshot.get('instagram');
                                        facebookJoin =
                                            documentSnapshot.get('facebook');
                                        lineJoin = documentSnapshot.get('line');
                                        createCountJoin =
                                            documentSnapshot.get('createCount');
                                        joinCountJoin =
                                            documentSnapshot.get('joinCount');
                                        likeJoin = documentSnapshot.get('like');
                                        imageJoin =
                                            documentSnapshot.get('image');
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Card(
                                            elevation: 50,
                                            shadowColor: Colors.black,
                                            color: Styles.bgBackground,
                                            child: SizedBox(
                                              width: 10,
                                              height: 250,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Styles.buttonColor,
                                                      radius: 108,
                                                      child: CircleAvatar(
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
                                                    Text(
                                                      'Participant',
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                        color:
                                                            Colors.green[900],
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                              Alignment.center,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                usernameJoin,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 25,
                                                                  color: Styles
                                                                      .buttonColor,
                                                                ), //Textstyle
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                describeJoin,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  color: Styles
                                                                      .buttonColor,
                                                                ), //Textstyle
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Image.asset(
                                                                "assets/icons/instagram.png",
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {},
                                                            ),
                                                            Text(
                                                              "Instagram: ",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Styles
                                                                    .buttonColor,
                                                              ), //Textstyle
                                                            ),
                                                            Text(
                                                              instagramJoin,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Styles
                                                                    .buttonColor,
                                                              ), //Textstyle
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Image.asset(
                                                                "assets/icons/facebook.png",
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {},
                                                            ),
                                                            Text(
                                                              "Facebook: ",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Styles
                                                                    .buttonColor,
                                                              ), //Textstyle
                                                            ),
                                                            Text(
                                                              facebookJoin,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Styles
                                                                    .buttonColor,
                                                              ), //Textstyle
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Image.asset(
                                                                "assets/icons/line.png",
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {},
                                                            ),
                                                            Text(
                                                              "Line: ",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Styles
                                                                    .buttonColor,
                                                              ), //Textstyle
                                                            ),
                                                            Text(
                                                              lineJoin,
                                                              style: TextStyle(
                                                                fontSize: 20,
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

                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Styles
                                                                        .buttonColor)),
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
                                        borderRadius: BorderRadius.circular(24),
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
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataList[num].value[3],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
                              padding: EdgeInsets.only(left: 2.0, bottom: 2),
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
            ),
          ),
      ],
    );
  }
}
