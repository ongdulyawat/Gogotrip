import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';


import '../../../controllers/user_model.dart';
import '../../home/homepage_screen.dart';

class CreatePartyBody extends StatefulWidget {
  const CreatePartyBody({Key? key}) : super(key: key);

  @override
  State<CreatePartyBody> createState() => _CreatePartyBodyState();
}

class _CreatePartyBodyState extends State<CreatePartyBody> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference checkCollection = FirebaseFirestore.instance.collection('checks');
  final FirebaseFirestore firestoreDocument = FirebaseFirestore.instance;


  final TextEditingController _noteController = TextEditingController();

  // randomField(){
  //   return
  //   Timer.periodic(Duration(seconds: 30), (timer) {
  //     //  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //     // Random _rnd = Random();
  //     //
  //     // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  //     //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //     //String randomString = randomAlphaNumeric(10);
  //     String generateRandomString() {
  //       const _chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  //       Random _rnd = Random();
  //       return String.fromCharCodes(Iterable.generate(10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //     }
  //   });
  // }
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';

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

  // getDocument () async {
  //   if(place == "Temple"){
  //     await firestoreDocument.collection('temples').doc(placeId).set({
  //       'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
  //         ,placeUrl]),
  //     });
  //   }
  //   else if(place == "Beach"){
  //     await firestoreDocument.collection('beaches').doc(placeId).set({
  //       'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
  //         ,placeUrl]),
  //     });
  //   }
  //   else if(place == "Restaurant"){
  //     await firestoreDocument.collection('restaurants').doc(placeId).set({
  //       'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
  //         ,placeUrl]),
  //     });
  //   }
  //   else if(place == "Park"){
  //     await firestoreDocument.collection('parks').doc(placeId).set({
  //       'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
  //         ,placeUrl]),
  //     });
  //   }
  //   else {
  //     await firestoreDocument.collection('cafes').doc(placeId).set({
  //       'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
  //         ,placeUrl]),
  //     });
  //   }
  //
  // }

  TextEditingController? controller;
  late DateTime _selectDate = DateTime.now();
  String _endTime = "9.30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  bool clickBoy = false;
  bool clickGirl = false;
  bool clickAny = false;
  var maxLength = 35;
  var textLength = 0;
  int _selectMember = 1;
  List<int> memberNum = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  clickButtonBoy() {
    setState(() {
      clickBoy = !clickBoy;
    });
  }

  clickButtonGirl() {
    setState(() {
      clickGirl = !clickGirl;
    });
  }

  clickButtonAny() {
    setState(() {
      clickAny = !clickAny;
    });
  }

  _getDate() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2030));
    if (_pickDate != null) {
      setState(() {
        _selectDate = _pickDate;

      });
    }
  }

  _getTime({required bool isStartTime}) async {
    var pickTime = await _showTimePicker();
    String _formateTime = pickTime.format(context);
    if (pickTime == null) {
      print('time error');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formateTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formateTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }

  Future<void> checkIfDocumentExists(String documentId) async {
    if(place == "Temple"){
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('temples')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        //getDocument();
        print('Document does not exist!');
      }
    }
    else if(place == "Beach"){
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('beaches')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        //getDocument();
        print('Document does not exist!');
      }
    }
    else if(place == "Restaurant"){
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('restaurants')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        //getDocument();
        print('Document does not exist!');
      }
    }
    else if(place == "Park"){
      DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
          .collection('parks')
          .doc(documentId)
          .get();
      if (snapshotDocument.exists) {
        print('Document already exists!');
      }
      else {
        //getDocument();
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
        //getDocument();
        print('Document does not exist!');
        print(loggedInUser.uid);
      }
    }

  }
  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    // Future.delayed(Duration(milliseconds: 1100), () {
    //checkIfDocumentExists(placeId);
    // });
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });

    // Future.delayed(Duration(milliseconds: 1100), () {
    //   print(loggedInUser.uid);
    // });
    getRandomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 58,
                child: Text(placeName,
                    style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(fontSize: 40))),
              ),
              Expanded(
                  flex: 42,
                  child: GestureDetector(
                      onTap: () async {
                        checkIfDocumentExists(placeId);
                        final String note = _noteController.text.trim();
                        String typeSex = '';
                        //Future.delayed(Duration(milliseconds: 1100), () async {
                        if(clickAny == true){
                          typeSex = "Any";
                        }
                        else if(clickBoy == true){
                          typeSex = "Boy";
                        }
                        else if(clickGirl == true){
                          typeSex = "Girl";
                        }
                          if (place == "Temple") {
                            DocumentSnapshot snapshotDocument = await FirebaseFirestore
                                .instance
                                .collection('temples')
                                .doc(placeId)
                                .get();

                            await firestoreDocument.collection('temples').doc(
                                placeId).update({
                              getRandomString(10): FieldValue.arrayUnion([
                                _selectDate, _startTime, _endTime,typeSex, _selectMember, note, loggedInUser.uid
                              ]),
                              'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
                                ,placeUrl]),
                            });
                            await _users.doc(loggedInUser.uid).update({
                              getRandomString(10): FieldValue.arrayUnion([
                              _selectDate, _startTime, _endTime,typeSex, _selectMember, note, loggedInUser.uid
                            ]),
                            });
                            // getDocument();
                            print('Temple Document does not exist!');
                          }
                          else if (place == "Beach") {
                            DocumentSnapshot snapshotDocument = await FirebaseFirestore
                                .instance
                                .collection('beaches')
                                .doc(placeId)
                                .get();
                            await firestoreDocument.collection('beaches').doc(
                                placeId).update({
                              getRandomString(10): FieldValue.arrayUnion([
                                _selectDate, _startTime, _endTime, typeSex, _selectMember, note, loggedInUser.uid
                              ]),
                              'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
                                ,placeUrl]),
                            });
                            print('Beach Document does not exist!');
                          }
                          else if (place == "Restaurant") {
                            DocumentSnapshot snapshotDocument = await FirebaseFirestore
                                .instance
                                .collection('restaurants')
                                .doc(placeId)
                                .get();
                            await firestoreDocument.collection('restaurants')
                                .doc(placeId)
                                .set({
                              getRandomString(10): FieldValue.arrayUnion([
                                _selectDate, _startTime, _endTime, typeSex, _selectMember, note, loggedInUser.uid
                              ]),
                              'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
                                ,placeUrl]),
                            });
                            print('Restaurant Document does not exist!');
                          }
                          else if (place == "Park") {
                            DocumentSnapshot snapshotDocument = await FirebaseFirestore
                                .instance
                                .collection('parks')
                                .doc(placeId)
                                .get();
                            await firestoreDocument.collection('parks').doc(
                                placeId).update({
                              getRandomString(10): FieldValue.arrayUnion([
                                _selectDate, _startTime, _endTime, typeSex, _selectMember, note, loggedInUser.uid
                              ]),
                              'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
                                ,placeUrl]),
                            });
                            print('Park Document does not exist!');
                          }
                          else {
                            DocumentSnapshot snapshotDocument = await FirebaseFirestore
                                .instance
                                .collection('cafes')
                                .doc(placeId)
                                .get();
                            await firestoreDocument.collection('cafes').doc(
                                placeId).update({
                              getRandomString(10): FieldValue.arrayUnion([
                                _selectDate, _startTime, _endTime,typeSex, _selectMember, note, loggedInUser.uid
                              ]),
                              'Info': FieldValue.arrayUnion([placeClose, placeOpen, placeId, placeInfo, placeName
                                ,placeUrl]),
                            });
                            print('Cafe Document does not exist!');
                          }
                        //});
                        final String? a = loggedInUser.createCount;
                        int b = int.parse(a!) + 1;
                        String c = b.toString();
                        await _users.doc(user!.uid)
                            .update({"createCount": c});
                        print("aaaaaaaaa"+a);
                        print(b);
                        print("cccccccccc"+c);
                        print("xxxxxxxaaaaaaaa"+ note);
                        print("xxxxxx"+ getRandomString(10));

                      Navigator.push(
                      context,
                        MaterialPageRoute(
                      builder: (context) =>
                        const HomePage(
                          ),
                          ));

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                              color: Styles.buttonColor,
                              border: Border.all(
                                  width: 2.0, color: Styles.buttonColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.exposure_plus_1,
                                  size: 17,
                                  color: Colors.white
                                ),
                                const SizedBox(width: 3),
                                Text('Create Party',
                                    style: GoogleFonts.poppins(
                                        textStyle:  TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Date",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(height: 5),
          Container(
            height: 52,
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2.0, color: Styles.buttonColor),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  enabled: false,
                  autofocus: false,
                  cursorColor: Styles.buttonColor,
                  // controller: controller,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Colors.transparent,
                          width: 0),
                    ),
                    // hintText: DateFormat.yMMMMd().format(_selectDate),
                    hintText:
                        "${_selectDate.day}/${_selectDate.month}/${_selectDate.year}",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600])),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                )),
                Container(
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {

                      _getDate();
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Start Time",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              Expanded(
                child: Text("End Time",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        cursorColor: Styles.buttonColor,
                        //controller: _startDateController,
                        // controller: controller,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.transparent,
                                width: 0),
                          ),
                          // hintText: DateFormat.yMMMMd().format(_selectDate),
                          hintText: _startTime,
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                        ),
                      )),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTime(isStartTime: true);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        cursorColor: Styles.buttonColor,
                        //controller: _endDateController,
                        // controller: controller,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.transparent,
                                width: 0),
                          ),
                          // hintText: DateFormat.yMMMMd().format(_selectDate),
                          hintText: _endTime,
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                        ),
                      )),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTime(isStartTime: false);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 75,
                child: Text("Sex",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              Expanded(
                flex: 25,
                child: Text("Member",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                  flex: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 2.0, color: Styles.buttonColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                clickButtonBoy();
                                setState(() {
                                  clickGirl = false;
                                  clickAny = false;
                                });

                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickBoy == false
                                      ? Colors.white
                                      : Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: clickBoy == false
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                clickButtonGirl();
                                setState(() {
                                  clickBoy = false;
                                  clickAny = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickGirl == false
                                      ? Colors.white
                                      : Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("G",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: clickGirl == false
                                              ? Colors.black
                                              : Colors.white)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                clickButtonAny();
                                setState(() {
                                  clickBoy = false;
                                  clickGirl = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickAny == false
                                      ? Colors.white
                                      : Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Any",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: clickAny == false
                                              ? Colors.black
                                              : Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 25,
                child: Container(
                  height: 52,
                  width: 25,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          autofocus: false,
                          cursorColor: Styles.buttonColor,
                          //controller: _memberController,
                          // controller: controller,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.transparent,
                                  width: 0),
                            ),
                            // hintText: DateFormat.yMMMMd().format(_selectDate),
                            hintText: "$_selectMember",
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            disabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                        ),
                      ),
                      DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            width: 0,
                          ),
                          items: memberNum
                              .map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectMember = int.parse(newValue!);
                            });
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text("Note",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(height: 5),
          Container(
            height: 70,
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2.0, color: Styles.buttonColor),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      minLines: 1,
                  maxLines: 2,
                  maxLength: maxLength,
                  keyboardType: TextInputType.multiline,
                  enabled: true,
                  autofocus: false,
                  cursorColor: Styles.buttonColor,
                  onChanged: (value) {
                    setState(() {
                      textLength = value.length;
                    });
                  },
                      controller: _noteController,
                  // controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    suffixText:
                        '${textLength.toString()}/${maxLength.toString()}',
                    counterText: "",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Colors.transparent,
                          width: 0),
                    ),
                    // hintText: DateFormat.yMMMMd().format(_selectDate),
                    hintText: "Add your note",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600])),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
