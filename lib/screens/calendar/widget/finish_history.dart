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
  int templeLength = 0;
  int restaurantLength = 0;
  int beachLength = 0;
  int cafeLength = 0;
  int parkLength = 0;
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
            cafeRef.get().then((cafeSnapshot) async {
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
                    for(int a = 0; a < 7; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                        //fieldCafeInfo.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                      }
                      else if(a == 6 ){
                        allHistory.add(fieldCafe[a]);
                        //fieldCafeInfo.add(fieldCafe[a]);
                        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cafes').doc(cafe.id).get();
                        Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                        if (dataMap != null) {
                          List<dynamic>? infoList = dataMap['Info'];
                          if (infoList != null) {
                            dynamic infoAtIndex = infoList[5];
                            dynamic nameAtIndex = infoList[4];
                            // allHistory.add("Cafe");
                            allHistory.add(nameAtIndex);
                            allHistory.add(infoAtIndex);
                            //fieldCafeInfo.add(infoAtIndex);
                          }
                        }
                      }
                      else{
                       allHistory.add(fieldCafe[a]);
                        //fieldCafeInfo.add(fieldCafe[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 7; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                      //fieldCafeInfo.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                    }
                    else if(a == 6 ){
                      allHistory.add(fieldCafe[a]);
                      //fieldCafeInfo.add(fieldCafe[a]);
                      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('cafes').doc(cafe.id).get();
                      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                      if (dataMap != null) {
                        List<dynamic>? infoList = dataMap['Info'];
                        if (infoList != null) {
                          dynamic infoAtIndex = infoList[5];
                          dynamic nameAtIndex = infoList[4];
                          //allHistory.add("Cafe");
                          allHistory.add(nameAtIndex);
                          allHistory.add(infoAtIndex);
                          //fieldCafeInfo.add(infoAtIndex);
                        }
                      }
                    }
                    else {
                      allHistory.add(fieldCafe[a]);
                      //fieldCafeInfo.add(fieldCafe[a]);
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
            temRef.get().then((temSnapshot) async {
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
                    for(int a = 0; a < 7; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                        //fieldTemInfo.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                      }
                      else if(a == 6 ){
                        allHistory.add(fieldTem[a]);
                        //fieldTemInfo.add(fieldTem[a]);
                        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('temples').doc(tem.id).get();
                        Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                        if (dataMap != null) {
                          List<dynamic>? infoList = dataMap['Info'];
                          if (infoList != null) {
                            dynamic infoAtIndex = infoList[5];
                            dynamic nameAtIndex = infoList[4];
                            //allHistory.add("Temple");
                            allHistory.add(nameAtIndex);
                            allHistory.add(infoAtIndex);
                            //fieldTemInfo.add(infoAtIndex);
                          }
                        }
                      }
                      else{
                        allHistory.add(fieldTem[a]);
                        //fieldTemInfo.add(fieldTem[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 7; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                      //fieldTemInfo.add(DateFormat.yMMMMd().format(fieldTem[a].toDate()));
                    }
                    else if(a == 6){
                      allHistory.add(fieldTem[a]);
                      //fieldTemInfo.add(fieldTem[a]);
                      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('temples').doc(tem.id).get();
                      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                      if (dataMap != null) {
                        List<dynamic>? infoList = dataMap['Info'];
                        if (infoList != null) {
                          dynamic infoAtIndex = infoList[5];
                          dynamic nameAtIndex = infoList[4];
                          //allHistory.add("Temple");
                          allHistory.add(nameAtIndex);
                          allHistory.add(infoAtIndex);
                          //fieldTemInfo.add(infoAtIndex);
                        }
                      }
                    }
                    else {
                      allHistory.add(fieldTem[a]);
                      //fieldTemInfo.add(fieldTem[a]);
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
            beaRef.get().then((beaSnapshot) async {
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
                    for(int a = 0; a < 7; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                        //fieldBeaInfo.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                      }
                      else if(a == 6 ){
                        allHistory.add(fieldBea[a]);
                        //fieldBeaInfo.add(fieldBea[a]);
                        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('beaches').doc(bea.id).get();
                        Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                        if (dataMap != null) {
                          List<dynamic>? infoList = dataMap['Info'];
                          if (infoList != null) {
                            dynamic infoAtIndex = infoList[5];
                            dynamic nameAtIndex = infoList[4];
                            // allHistory.add("Beach");
                            allHistory.add(nameAtIndex);
                            allHistory.add(infoAtIndex);
                            //fieldBeaInfo.add(infoAtIndex);
                          }
                        }
                      }
                      else{
                        allHistory.add(fieldBea[a]);
                        //fieldBeaInfo.add(fieldBea[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 7; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                      //fieldBeaInfo.add(DateFormat.yMMMMd().format(fieldBea[a].toDate()));
                    }
                    else if(a == 6 ){
                      allHistory.add(fieldBea[a]);
                      //fieldBeaInfo.add(fieldBea[a]);
                      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('beaches').doc(bea.id).get();
                      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                      if (dataMap != null) {
                        List<dynamic>? infoList = dataMap['Info'];
                        if (infoList != null) {
                          dynamic infoAtIndex = infoList[5];
                          dynamic nameAtIndex = infoList[4];
                          //allHistory.add("Beach");
                          allHistory.add(nameAtIndex);
                          allHistory.add(infoAtIndex);
                          //fieldBeaInfo.add(infoAtIndex);
                        }
                      }
                    }
                    else {
                      allHistory.add(fieldBea[a]);
                      //fieldBeaInfo.add(fieldBea[a]);
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
            resRef.get().then((resSnapshot) async {
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
                    for(int a = 0; a < 7; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                        //fieldResInfo.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                      }
                      else if(a == 6){
                        allHistory.add(fieldRes[a]);
                        //fieldResInfo.add(fieldRes[a]);
                        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('restaurants').doc(res.id).get();
                        Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                        if (dataMap != null) {
                          List<dynamic>? infoList = dataMap['Info'];
                          if (infoList != null) {
                            dynamic infoAtIndex = infoList[5];
                            dynamic nameAtIndex = infoList[4];
                            //allHistory.add("Restaurant");
                            allHistory.add(nameAtIndex);
                            allHistory.add(infoAtIndex);
                            //fieldResInfo.add(infoAtIndex);
                          }
                        }
                      }
                      else{
                        allHistory.add(fieldRes[a]);
                        //fieldResInfo.add(fieldRes[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 7; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                      //fieldResInfo.add(DateFormat.yMMMMd().format(fieldRes[a].toDate()));
                    }
                    else if(a == 6 ){
                      allHistory.add(fieldRes[a]);
                      //fieldResInfo.add(fieldRes[a]);
                      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('restaurants').doc(res.id).get();
                      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                      if (dataMap != null) {
                        List<dynamic>? infoList = dataMap['Info'];
                        if (infoList != null) {
                          dynamic infoAtIndex = infoList[5];
                          dynamic nameAtIndex = infoList[4];
                          //allHistory.add("Restaurant");
                          allHistory.add(nameAtIndex);
                          allHistory.add(infoAtIndex);
                          //fieldResInfo.add(infoAtIndex);
                        }
                      }
                    }
                    else {
                      allHistory.add(fieldRes[a]);
                      //fieldResInfo.add(fieldRes[a]);
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
            parkRef.get().then((parkSnapshot) async {
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
                    for(int a = 0; a < 7; a++ ) {
                      if(a == 0){
                        allHistory.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                        //fieldParkInfo.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                      }
                      else if(a == 6){
                        allHistory.add(fieldPark[a]);
                        //fieldParkInfo.add(fieldPark[a]);
                        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('parks').doc(park.id).get();
                        Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                        if (dataMap != null) {
                          List<dynamic>? infoList = dataMap['Info'];
                          if (infoList != null) {
                            dynamic infoAtIndex = infoList[5];
                            dynamic nameAtIndex = infoList[4];
                            //allHistory.add("Park");
                            allHistory.add(nameAtIndex);
                            allHistory.add(infoAtIndex);
                            //fieldParkInfo.add(infoAtIndex);
                          }
                        }
                      }
                      else{
                        allHistory.add(fieldPark[a]);
                        //fieldParkInfo.add(fieldPark[a]);
                      }
                    }
                  }
                }
                else if(timestamp.isBefore(now)){
                  for(int a = 0; a < 7; a++ ) {
                    if(a == 0){
                      allHistory.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                      //fieldParkInfo.add(DateFormat.yMMMMd().format(fieldPark[a].toDate()));
                    }
                    else if(a == 6 ){
                      allHistory.add(fieldPark[a]);
                      //fieldParkInfo.add(fieldPark[a]);
                      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('parks').doc(park.id).get();
                      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;
                      if (dataMap != null) {
                        List<dynamic>? infoList = dataMap['Info'];
                        if (infoList != null) {
                          dynamic infoAtIndex = infoList[5];
                          dynamic nameAtIndex = infoList[4];
                          //allHistory.add("Park");
                          allHistory.add(nameAtIndex);
                          allHistory.add(infoAtIndex);
                          //fieldParkInfo.add(infoAtIndex);
                        }
                      }
                    }
                    else {
                      allHistory.add(fieldPark[a]);
                      //fieldParkInfo.add(fieldPark[a]);
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
    Future.delayed(Duration(seconds: 35), () {
      setState(() {
        _timerFinished = true;
      });
    });
  }
  // mixTemple(){
  //   templeLength = fieldTemInfo.length;
  //   if(templeLength != 0){
  //     allHistory.add(fieldTemInfo);
  //   }
  // }
  // mixRestaurant(){
  //   restaurantLength = fieldResInfo.length;
  //   if(restaurantLength != 0){
  //     allHistory.add(fieldResInfo);
  //   }
  // }
  // mixBeach(){
  //   beachLength = fieldBeaInfo.length;
  //   if(beachLength != 0 ){
  //     allHistory.add(fieldBeaInfo);
  //   }
  //
  // }
  // mixCafe(){
  //   cafeLength = fieldCafeInfo.length;
  //   if(cafeLength != 0){
  //     allHistory.add(fieldCafeInfo);
  //   }
  // }
  // mixPark(){
  //   parkLength = fieldParkInfo.length;
  //
  //   if(parkLength != 0){
  //     allHistory.add(fieldParkInfo);
  //   }
  // }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      getUserCreate();
    });
    Future.delayed(Duration(milliseconds: 1300), () {
      getHistoryCafe();
    });
    Future.delayed(Duration(milliseconds: 7000), () {
      getHistoryTemple();
    });
    Future.delayed(Duration(milliseconds: 14000), () {
      getHistoryBeach();
    });
    Future.delayed(Duration(milliseconds: 21000), () {
      getHistoryRestaurant();
    });
    Future.delayed(Duration(milliseconds: 28000), () {
      getHistoryPark();
    });
    // Future.delayed(Duration(milliseconds: 34000), () {
    //   mixTemple();
    // });
    // Future.delayed(Duration(milliseconds: 35000), () {
    //   mixRestaurant();
    // });
    // Future.delayed(Duration(milliseconds: 36000), () {
    //   mixBeach();
    // });
    // Future.delayed(Duration(milliseconds: 37000), () {
    //   mixCafe();
    // });
    // Future.delayed(Duration(milliseconds: 38000), () {
    //   mixPark();
    // });
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
    print(allHistory);
    print(allHistory.length);
    return _timerFinished? GridView.count(
      childAspectRatio: 2.2,
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int num = 0; num < allHistory.length; num+=9)
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
                    Container(
                      height: 35,
                      width: 310,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 3.0, left: 28),
                        child: Text(
                          allHistory[num + 7],
                          style: GoogleFonts.bebasNeue(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
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
                                    // image:
                                    // AssetImage('assets/images/beach.png')
                                  image: NetworkImage(allHistory[num+8]),
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
                                allHistory[num],
                                // DateFormat.yMMMMd().format(dataList[num].value[0].toDate()),
                                // "30 October",
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
                                  Text("${allHistory[num+1]}"+"-"+"${allHistory[num+2]}"),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              // Text(dataList[num].value[5],
                              Text(
                                allHistory[num+5],
                                style: GoogleFonts.poppins(fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0,left: 22),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 70,
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               for (int count = 0; count < 6; count++)
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(left: 5.0),
                    //                   child: Container(
                    //                     width: 20,
                    //                     height: 20,
                    //                     decoration: BoxDecoration(
                    //                       color: colorUser[count],
                    //                       borderRadius:
                    //                       BorderRadius.circular(24),
                    //                       boxShadow: Styles.boxShadows,
                    //                     ),
                    //                     child: const Icon(
                    //                       Icons.person_2_outlined,
                    //                       size: 12,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 30,
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 width: 25,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.blue,
                    //                     borderRadius: BorderRadius.circular(16)),
                    //                 child: Row(
                    //                   crossAxisAlignment:
                    //                   CrossAxisAlignment.center,
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: const [
                    //                     Text(
                    //                       "B",
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               const Text("6/6", style: TextStyle(fontSize: 10)),
                    //               const Padding(
                    //                 padding:
                    //                 EdgeInsets.only(left: 2.0, bottom: 2),
                    //                 child: Icon(
                    //                   Icons.person,
                    //                   size: 14,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
      ],
    ):Center(child: CircularProgressIndicator());
  }
}
