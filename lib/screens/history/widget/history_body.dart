import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controllers/user_model.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  List<dynamic> userCreateJoin = [];
  List<dynamic> fieldCafe = [];
  List<dynamic> fieldCafeInfo = [];
  bool _timerFinished = false;
  List colorUser = [
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.red,
  ];
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');

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
  getPlace() async {
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

                   if(fieldCafe[0].toDate().year == now.year && fieldCafe[0].toDate().month == now.month && fieldCafe[0].toDate().day == now.day){
                     DateTime parsedTime = DateFormat('h:mm').parse(fieldCafe[2]);
                     // String convertedTime = DateFormat('HH:mm').format(parsedTime);
                     // DateTime parseDate = DateFormat('HH:mm').parse(convertedTime);

                     String formattedTime = DateFormat('h:mm').format(now);
                     DateTime timeNow = DateFormat('hh:mm').parse(formattedTime);
                     print("-----");
                     // print(parseDate);
                     // print("XXXX-");
                     print(parsedTime);
                     print(timeNow);
                     //print(DateFormat('h:mm').parse(formattedTime));
                     print("-----");

                     // DateTime parsedTimeCons = DateFormat('h.mm a').parse('9.30 PM');
                     // print(parsedTimeCons);
                     if(parsedTime.isBefore(timeNow)){
                     //print("XXWWW"+fieldCafe[2]);
                       print("xxx");
                       print(now);
                       for(int a = 0; a < 6; a++ ) {
                         print(fieldCafe[a]);
                         if(a == 0){
                           fieldCafeInfo.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                         }
                         else{
                           fieldCafeInfo.add(fieldCafe[a]);
                         }
                       }
                     }
                   }
                   else if(timestamp.isBefore(now)){
                     for(int a = 0; a < 6; a++ ) {
                       print(fieldCafe[a]);
                       if(a == 0){
                         fieldCafeInfo.add(DateFormat.yMMMMd().format(fieldCafe[a].toDate()));
                       }
                       else{
                         fieldCafeInfo.add(fieldCafe[a]);
                       }
                     }
                   }
                   else{
                     for(int a = 0; a < 6; a++ ) {
                       print("EYUIO");
                       print(fieldCafe[a]);

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
    Future.delayed(Duration(seconds: 5), () {
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
      getPlace();
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
    print(fieldCafeInfo);
    print(fieldCafeInfo.length);
    return _timerFinished ?GridView.count(
      childAspectRatio: 2.2,
      physics: const NeverScrollableScrollPhysics(),
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
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  boxShadow: Styles.boxShadows,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
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
                                  Text("12.00 - 14.00"),
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
                                  Text("6/6", style: TextStyle(fontSize: 10)),
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
              Container(
                width: 302,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  boxShadow: Styles.boxShadows,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("Success! Thanks for join us",style: TextStyle(color: Colors.white,fontSize: 10)),
                    )
                  ],
                ),
              ),
            ],
          ),
      ],
    ): Center(child: CircularProgressIndicator());
  }
}
