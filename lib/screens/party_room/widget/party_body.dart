import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/user_model.dart';

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


  final CollectionReference checkCollection = FirebaseFirestore.instance
      .collection('checks');
  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';

  void get data => null;
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

  // Future<String?> fetchTempleData(String placeId) async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshotDetail =
  //   await FirebaseFirestore.instance.collection('temples').doc(placeId).get();
  //
  //   //var datalength = snapshotDetail.data.length;
  //   if (snapshotDetail.exists) {
  //     Map<String, dynamic>? data = snapshotDetail.data();
  //     //setState(() {
  //        var datalength = data?.length;
  //       data?.remove('Info');
  //       print("Show Field");// remove the Info field
  //       print(data);
  //       print(data?[1]);
  //       print(datalength);
  //     //});
  //
  //
  //
  //   } else {
  //     print('Document with placeId $placeId does not exist.');
  //   }
  //   // Map<String, dynamic>? data = snapshotDetail.data();
  //   // var datalength = data?.length;
  //   // return datalength;
  // }
  // void retrieveData(){
  //   FirebaseFirestore.instance.collection('temples').get().then((value) =>{
  //     value.docs.forEach((result) {
  //       print(result.data());
  //     })
  //   });
  // }

  void retrieveAllData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshotDetail =
    await FirebaseFirestore.instance.collection('temples').doc(placeId).get();
    if (snapshotDetail.exists) {
      Map<String, dynamic>? data = snapshotDetail.data();
      //List<dynamic>? dataSelect = snapshotDetail.data()?['data'];
      data?.remove('Info');
      //String element = snapshotDetail.data()!["arrayKey"][1];
      print("Show   REeeeee   eeeeField");
      print(data);
      //print(element);
      //print(dataSelect);
    }
  }

  // void retrieveAllData() async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshotDetail =
  //   await FirebaseFirestore.instance.collection('temples').doc(placeId).get();
  //   if (snapshotDetail.exists) {
  //     List<dynamic>? data = snapshotDetail.data()?['data'];
  //     if (data != null) {
  //       // Retrieve only index 1 and 2 of the data array
  //       //data?.remove('Info');
  //       print(data);
  //       List<dynamic> selectedData = [data[0], data[1]];
  //       print("Selected data:");
  //       print(selectedData);
  //     }
  //   }
  // }




  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    // Future.delayed(Duration(milliseconds: 1100), () {
    //   fetchTempleData(placeId);
    // });
    // Future.delayed(Duration(milliseconds: 1100), () {
    //   retrieveData();
    // });
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });

    Future.delayed(Duration(milliseconds: 1100), () {
      retrieveAllData();
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
        for (int num = 0; num < 3 ; num++)
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
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                boxShadow: Styles.boxShadows,
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.business_center,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 210),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15),
                        child: GestureDetector(
                          onTap: () async {
                            // final String? a = loggedInUser.joinCount;
                            // int b = int.parse(a!) + 1;
                            // String c = b.toString();
                            // await _users.doc(user!.uid)
                            //     .update({"joinCount": c});
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
                                  image : NetworkImage(placeUrl),
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
                              "30 October",
                              style: GoogleFonts.bebasNeue(fontSize: 30),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time ",
                                  style: GoogleFonts.bebasNeue(fontSize: 20),
                                ),
                                const Text("12.00 - 14.00"),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Room for women!",
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 25),
                          child: Row(
                            children: [
                              for (int count = 0; count < loopUser; count++)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
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
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 90),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            const Text("6 / 6", style: TextStyle(fontSize: 10)),
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
