import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controllers/user_model.dart';

class FinishHistory extends StatefulWidget {
  const FinishHistory({Key? key}) : super(key: key);

  @override
  State<FinishHistory> createState() => _FinishHistoryState();
}

class _FinishHistoryState extends State<FinishHistory> {
  List<dynamic> userCreateJoin = [];
  List<dynamic> fieldCafe = [];
  List<dynamic> fieldCafeInfo = [];
  List<dynamic> fieldTem = [];
  List<dynamic> fieldTemInfo = [];
  List<dynamic> fieldBea = [];
  List<dynamic> fieldBeaInfo = [];
  List<dynamic> fieldRes = [];
  List<dynamic> fieldResInfo = [];
  List<dynamic> fieldPark = [];
  List<dynamic> fieldParkInfo = [];
  List<dynamic> allHistory = [];
  bool _timerFinished = false;
  bool _timerCheckCafe = false;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');

  List colorUser = [
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.red,
  ];
  getUserCreate() async {
    DocumentSnapshot<Map<String, dynamic>> snapshotUser =
    await FirebaseFirestore.instance.collection('users').doc(loggedInUser.uid).get();
    if(snapshotUser.exists){
      Map<String, dynamic>? dataUser = snapshotUser.data();
      dynamic createValue = dataUser?['create'];
      dynamic joinValue = dataUser?['join'];
      userCreateJoin = [createValue, joinValue];
    }
  }

  getHistoryCafe() async {
    for(int i = 0; i < 2 ; i++){
      for(int j = 0; j < userCreateJoin[i].length ; j++){
        await FirebaseFirestore.instance.collection('cafes')
            .get().then((value) async {
          for(var cafe in value.docs){
            final cafeRef = FirebaseFirestore.instance.collection('cafes').doc(cafe.id);
            cafeRef.get().then((cafeSnapshot) {
              Map<String, dynamic> dataCafe = cafeSnapshot.data() ?? {};
              if (dataCafe.containsKey(userCreateJoin[i][j])) {
                fieldCafe = cafeSnapshot.data()![userCreateJoin[i][j]];
                DateTime now = DateTime.now();
                DateTime timestamp = fieldCafe[0].toDate();

                if(timestamp.year == now.year && timestamp.month == now.month && timestamp.day == now.day){
                  DateTime parsedTime = DateFormat('h:mm').parse(fieldCafe[2]);

                  String formattedTime = DateFormat('h:mm').format(now);
                  DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);


                  if(parsedTime.isBefore(timeNow)){
                    for(int a = 0; a < 6; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                      }
                      else{
                        allHistory.add(fieldCafe[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 6; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                    }
                    else {
                      allHistory.add(fieldCafe[a]);
                    }
                  }
                }
              }
            });
          }
        });
      }
    }
  }
  getHistoryTemple() async {
    for(int i = 0; i < 2 ; i++){
      for(int j = 0; j < userCreateJoin[i].length ; j++){
        await FirebaseFirestore.instance.collection('temples')
            .get().then((value) async {
          for(var tem in value.docs){
            final temRef = FirebaseFirestore.instance.collection('temples').doc(tem.id);
            temRef.get().then((temSnapshot) {
              Map<String, dynamic> dataTem = temSnapshot.data() ?? {};
              if (dataTem.containsKey(userCreateJoin[i][j])) {
                fieldTem = temSnapshot.data()![userCreateJoin[i][j]];
                DateTime now = DateTime.now();
                DateTime timestamp = fieldTem[0].toDate();

                if(timestamp.year == now.year && timestamp.month == now.month && timestamp.day == now.day){
                  DateTime parsedTime = DateFormat('h:mm').parse(fieldTem[2]);

                  String formattedTime = DateFormat('h:mm').format(now);
                  DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

                  if(parsedTime.isBefore(timeNow)){
                    for(int a = 0; a < 6; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                      }
                      else{
                        allHistory.add(fieldTem[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 6; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                    }
                    else {
                      allHistory.add(fieldTem[a]);
                    }
                  }
                }
              }
            });
          }
        });
      }
    }
  }
  getHistoryBeach() async {
    for(int i = 0; i < 2 ; i++){
      for(int j = 0; j < userCreateJoin[i].length ; j++){
        await FirebaseFirestore.instance.collection('beaches')
            .get().then((value) async {
          for(var bea in value.docs){
            final beaRef = FirebaseFirestore.instance.collection('beaches').doc(bea.id);
            beaRef.get().then((beaSnapshot) {
              Map<String, dynamic> dataBea = beaSnapshot.data() ?? {};
              if (dataBea.containsKey(userCreateJoin[i][j])) {
                fieldBea = beaSnapshot.data()![userCreateJoin[i][j]];
                DateTime now = DateTime.now();
                DateTime timestamp = fieldBea[0].toDate();

                if(timestamp.year == now.year && timestamp.month == now.month && timestamp.day == now.day){
                  DateTime parsedTime = DateFormat('h:mm').parse(fieldBea[2]);

                  String formattedTime = DateFormat('h:mm').format(now);
                  DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

                  if(parsedTime.isBefore(timeNow)){
                    for(int a = 0; a < 6; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                      }
                      else{
                        allHistory.add(fieldBea[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 6; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                    }
                    else {
                      allHistory.add(fieldBea[a]);
                    }
                  }
                }
              }
            });
          }
        });
      }
    }
  }

  getHistoryRestaurant() async {
    for(int i = 0; i < 2 ; i++){
      for(int j = 0; j < userCreateJoin[i].length ; j++){
        await FirebaseFirestore.instance.collection('restaurants')
            .get().then((value) async {
          for(var res in value.docs){
            final resRef = FirebaseFirestore.instance.collection('restaurants').doc(res.id);
            resRef.get().then((resSnapshot) {
              Map<String, dynamic> dataRes = resSnapshot.data() ?? {};
              if (dataRes.containsKey(userCreateJoin[i][j])) {
                fieldRes = resSnapshot.data()![userCreateJoin[i][j]];
                DateTime now = DateTime.now();
                DateTime timestamp = fieldRes[0].toDate();

                if(timestamp.year == now.year && timestamp.month == now.month && timestamp.day == now.day){
                  DateTime parsedTime = DateFormat('h:mm').parse(fieldRes[2]);

                  String formattedTime = DateFormat('h:mm').format(now);
                  DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

                  if(parsedTime.isBefore(timeNow)){
                    for(int a = 0; a < 6; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                      }
                      else{
                        allHistory.add(fieldRes[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 6; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                    }
                    else {
                      allHistory.add(fieldRes[a]);
                    }
                  }
                }
              }
            });
          }
        });
      }
    }
  }
  getHistoryPark() async {
    for(int i = 0; i < 2 ; i++){
      for(int j = 0; j < userCreateJoin[i].length ; j++){
        await FirebaseFirestore.instance.collection('parks')
            .get().then((value) async {
          for(var park in value.docs){
            final parkRef = FirebaseFirestore.instance.collection('parks').doc(park.id);
            parkRef.get().then((parkSnapshot) {
              Map<String, dynamic> dataPark = parkSnapshot.data() ?? {};
              if (dataPark.containsKey(userCreateJoin[i][j])) {
                fieldPark = parkSnapshot.data()![userCreateJoin[i][j]];
                DateTime now = DateTime.now();
                DateTime timestamp = fieldPark[0].toDate();

                if(timestamp.year == now.year && timestamp.month == now.month && timestamp.day == now.day){
                  DateTime parsedTime = DateFormat('h:mm').parse(fieldPark[2]);

                  String formattedTime = DateFormat('h:mm').format(now);
                  DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);

                  if(parsedTime.isBefore(timeNow)){
                    for(int a = 0; a < 6; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                      }
                      else{
                        allHistory.add(fieldPark[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 6; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                    }
                    else {
                      allHistory.add(fieldPark[a]);
                    }
                  }
                }
              }
            });
          }
        });
      }
    }
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 20), () {
      setState(() {
        _timerFinished = true;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      getUserCreate();
    });
    Future.delayed(Duration(milliseconds: 600), () {
      getHistoryCafe();
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      getHistoryTemple();
    });
    Future.delayed(Duration(milliseconds: 7000), () {
      getHistoryBeach();
    });
    Future.delayed(Duration(milliseconds: 11000), () {
      getHistoryRestaurant();
    });
    Future.delayed(Duration(milliseconds: 16000), () {
      getHistoryPark();
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // print(fieldCafeInfo);
    // print(fieldCafeInfo.length);
    // print(_timerCheckCafe);
    // print(fieldTemInfo);
    // print(fieldTemInfo.length);
    // print(fieldBeaInfo);
    // print(fieldBeaInfo.length);
    // print(fieldResInfo);
    // print(fieldResInfo.length);
    // print(fieldParkInfo);
    // print(fieldParkInfo.length);
    print(allHistory);
    print(allHistory.length);
    return _timerFinished? GridView.count(
      childAspectRatio: 2.2,
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int num = 0; num < 10; num++)
        // for(int numArray = 0; numArray < 6 ; numArray++)
          Column(
            children: [
              Container(
                width: 300,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  boxShadow: Styles.boxShadows,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
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
                                image: const DecorationImage(
                                    image:
                                    AssetImage('assets/images/beach.png'),
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
                                // DateFormat.yMMMMd().format(dataList[num].value[0].toDate()),
                                "30 October",
                                style: GoogleFonts.bebasNeue(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time ",
                                    style:
                                    GoogleFonts.bebasNeue(fontSize: 20),
                                  ),
                                  // Text(dataList[num].value[1]+"-"+dataList[num].value[2]),
                                  const Text("12.00 - 14.00"),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              // Text(dataList[num].value[5],
                              Text(
                                "text",
                                style: GoogleFonts.poppins(fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 22),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Container(
                              child: Row(
                                children: [
                                  for (int count = 0; count < 6; count++)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
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
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "B",
                                          style: TextStyle(
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
                                  const Text("6/6", style: TextStyle(fontSize: 10)),
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
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
      ],
    ):Center(child: CircularProgressIndicator());
  }
}
