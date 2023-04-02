import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import '../../controllers/user_model.dart';
import '../detail_place/detail_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference checkCollection =
      FirebaseFirestore.instance.collection('checks');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  List<dynamic> field = [];
  List<dynamic> ids = [];
  List<dynamic> rateTem = [];
  List<dynamic> rateBea = [];
  List<dynamic> rateRes = [];
  List<dynamic> ratePark = [];
  List<dynamic> rateCafe = [];

  int countFav = 0;
  bool _timerFinished = false;

  List<dynamic> fieldRes = [];
  List<dynamic> idsRes = [];
  int countFavRes = 0;

  List<dynamic> fieldBea = [];
  List<dynamic> idsBea = [];
  int countFavBea = 0;

  List<dynamic> fieldPark = [];
  List<dynamic> idsPark = [];
  int countFavPark = 0;

  List<dynamic> fieldCafe = [];
  List<dynamic> idsCafe = [];
  int countFavCafe = 0;

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
    firestore.collection('checks').doc('state').update({'search': ''});
  }

  getFavourite() async {
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(loggedInUser.uid);
    docRef.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        List<dynamic> fieldFavourite = docSnapshot.data()!['favourite'];
        for (int num = 0; num < fieldFavourite.length; num++) {
          FirebaseFirestore.instance.collection('temples').get().then((value) {
            for (var x in value.docs) {
              if (x.id == fieldFavourite[num]) {
                final docTempleRef =
                    FirebaseFirestore.instance.collection('temples').doc(x.id);
                docTempleRef.get().then((docTempleSnapshot) {
                  if (docTempleSnapshot.exists) {
                    field = docTempleSnapshot.data()!['Info'];
                    rateTem.add(docTempleSnapshot.data()!['voteRating']);
                    for (int i = 0; i < field.length; i++) {
                      if (i != 3) {
                        ids.add(field[i]);
                      }
                    }
                  }
                  print(ids);
                });
                countFav++;
              }
            }
            setState(() {
              ids;
              countFav;
              rateTem;
            });
          });
          FirebaseFirestore.instance
              .collection('restaurants')
              .get()
              .then((value) {
            for (var r in value.docs) {
              if (r.id == fieldFavourite[num]) {
                final docRestaurantRef = FirebaseFirestore.instance
                    .collection('restaurants')
                    .doc(r.id);
                docRestaurantRef.get().then((docRestaurantSnapshot) {
                  if (docRestaurantSnapshot.exists) {
                    fieldRes = docRestaurantSnapshot.data()!['Info'];
                    rateRes.add(docRestaurantSnapshot.data()!['voteRating']);
                    for (int rr = 0; rr < fieldRes.length; rr++) {
                      if (rr != 3) {
                        idsRes.add(fieldRes[rr]);
                      }
                    }
                  }
                  print(idsRes);
                });
                countFavRes++;
              }
            }
            setState(() {
              countFavRes;
              idsRes;
              rateRes;
            });
          });
          FirebaseFirestore.instance.collection('beaches').get().then((value) {
            for (var b in value.docs) {
              if (b.id == fieldFavourite[num]) {
                final docBeachRef =
                    FirebaseFirestore.instance.collection('beaches').doc(b.id);
                docBeachRef.get().then((docBeachSnapshot) {
                  if (docBeachSnapshot.exists) {
                    fieldBea = docBeachSnapshot.data()!['Info'];
                    rateBea.add(docBeachSnapshot.data()!['voteRating']);
                    for (int bb = 0; bb < fieldBea.length; bb++) {
                      if (bb != 3) {
                        idsBea.add(fieldBea[bb]);
                      }
                    }
                  }
                  print(idsBea);
                });
                countFavBea++;
              }
            }
            setState(() {
              countFavBea;
              idsBea;
              rateBea;
            });
          });
          FirebaseFirestore.instance.collection('parks').get().then((value) {
            for (var p in value.docs) {
              if (p.id == fieldFavourite[num]) {
                final docParkRef =
                    FirebaseFirestore.instance.collection('parks').doc(p.id);
                docParkRef.get().then((docParkSnapshot) {
                  if (docParkSnapshot.exists) {
                    fieldPark = docParkSnapshot.data()!['Info'];
                    ratePark.add(docParkSnapshot.data()!['voteRating']);
                    for (int pp = 0; pp < fieldPark.length; pp++) {
                      if (pp != 3) {
                        idsPark.add(fieldPark[pp]);
                      }
                    }
                  }
                  print(idsPark);
                });
                countFavPark++;
              }
            }
            setState(() {
              countFavPark;
              idsPark;
              ratePark;
            });
          });
          FirebaseFirestore.instance.collection('cafes').get().then((value) {
            for (var c in value.docs) {
              if (c.id == fieldFavourite[num]) {
                final docCafeRef =
                    FirebaseFirestore.instance.collection('cafes').doc(c.id);
                docCafeRef.get().then((docCafeSnapshot) {
                  if (docCafeSnapshot.exists) {
                    fieldCafe = docCafeSnapshot.data()!['Info'];
                    rateCafe.add(docCafeSnapshot.data()!['voteRating']);
                    for (int cc = 0; cc < fieldCafe.length; cc++) {
                      if (cc != 3) {
                        idsCafe.add(fieldCafe[cc]);
                      }
                    }
                  }
                  print(idsCafe);
                });
                countFavCafe++;
              }
            }
            setState(() {
              countFavCafe;
              idsCafe;
              rateCafe;
            });
          });
        }
      }
    });
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _timerFinished = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(const Duration(milliseconds: 400), () async {
      await getFavourite();
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
    return _timerFinished
        ? Scaffold(
            backgroundColor: Styles.bgBackground,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                    child: Text(
                      "Temple",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ids.length != 0
                      ? Container(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countFav,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'place': 'Temple'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'detailReload': 'False'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeId': ids[(5 * index) + 2]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeName': ids[(5 * index) + 3]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeUrl': ids[(5 * index) + 4]
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(
                                              data: null,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: Styles.boxShadows),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: ids[(5 * index) +
                                                                4] !=
                                                            ''
                                                        ? NetworkImage(ids[
                                                            (5 * index) + 4])
                                                        : const AssetImage(
                                                                "assets/images/beach.png")
                                                            as ImageProvider,
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: Styles.boxShadows),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0, right: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    ids[(5 * index) + 3],
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("กรุงเทพมหานคร",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    const SizedBox(width: 3),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6.0,
                                                                  right: 5),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.lime,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                rateTem[index],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))
                      : SizedBox(
                          height: 220,
                          width: 380,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "no favorite temple yet.",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              )),
                        ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                    child: Text(
                      "Beach",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  idsBea.isNotEmpty
                      ? SizedBox(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countFavBea,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'place': 'Beach'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'detailReload': 'False'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeId': idsBea[(5 * index) + 2]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeName': idsBea[(5 * index) + 3]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeUrl': idsBea[(5 * index) + 4]
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(
                                              data: null,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: Styles.boxShadows),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: idsBea[(5 * index) +
                                                                4] !=
                                                            ''
                                                        ? NetworkImage(idsBea[
                                                            (5 * index) + 4])
                                                        : const AssetImage(
                                                                "assets/images/beach.png")
                                                            as ImageProvider,
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: Styles.boxShadows),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0, right: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    idsRes[5 * (index) + 3],
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("กรุงเทพมหานคร",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    const SizedBox(width: 3),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6.0,
                                                                  right: 5),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.lime,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                rateBea[index],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: 220,
                          width: 380,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "no favorite beach yet.",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              )),
                        ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                    child: Text(
                      "Restaurant",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  idsRes.length != 0
                      ? Container(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countFavRes,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'place': 'Restaurant'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'detailReload': 'False'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeId': idsRes[(5 * index) + 2]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeName': idsRes[(5 * index) + 3]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeUrl': idsRes[(5 * index) + 4]
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(
                                              data: null,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: Styles.boxShadows),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: idsRes[(5 * index) +
                                                                4] !=
                                                            ''
                                                        ? NetworkImage(idsRes[
                                                            (5 * index) + 4])
                                                        : const AssetImage(
                                                                "assets/images/beach.png")
                                                            as ImageProvider,
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: Styles.boxShadows),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0, right: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    idsRes[(5 * index) + 3],
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("กรุงเทพมหานคร",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    const SizedBox(width: 3),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6.0,
                                                                  right: 5),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.lime,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                rateRes[index],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: 220,
                          width: 380,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "no favorite restaurant yet.",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              )),
                        ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                    child: Text(
                      "Cafe",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  idsCafe.length != 0
                      ? SizedBox(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countFavCafe,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'place': 'Cafe'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'detailReload': 'False'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeId': idsCafe[(5 * index) + 2]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeName': idsCafe[(5 * index) + 3]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeUrl': idsCafe[(5 * index) + 4]
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(
                                              data: null,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: Styles.boxShadows),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: idsCafe[(5 * index) +
                                                                4] !=
                                                            ''
                                                        ? NetworkImage(idsCafe[
                                                            (5 * index) + 4])
                                                        : const AssetImage(
                                                                "assets/images/beach.png")
                                                            as ImageProvider,
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: Styles.boxShadows),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0, right: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    idsCafe[(5 * index) + 3],
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("กรุงเทพมหานคร",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    const SizedBox(width: 3),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6.0,
                                                                  right: 5),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.lime,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                rateCafe[index],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: 220,
                          width: 380,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "no favorite cafe yet.",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              )),
                        ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 45, bottom: 20),
                    child: Text(
                      "Park",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  idsPark.length != 0
                      ? SizedBox(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countFavPark,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'place': 'Park'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({'detailReload': 'False'});
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeId': idsPark[(5 * index) + 2]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeName': idsPark[(5 * index) + 3]
                                      });
                                      firestore
                                          .collection('checks')
                                          .doc('state')
                                          .update({
                                        'placeUrl': idsPark[(5 * index) + 4]
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen(
                                              data: null,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 165,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: Styles.boxShadows),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: idsPark[(5 * index) +
                                                                4] !=
                                                            ''
                                                        ? NetworkImage(idsPark[
                                                            (5 * index) + 4])
                                                        : const AssetImage(
                                                                "assets/images/beach.png")
                                                            as ImageProvider,
                                                    fit: BoxFit.fill),
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: Styles.boxShadows),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0, right: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    idsPark[(5 * index) + 3],
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text("กรุงเทพมหานคร",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    const SizedBox(width: 3),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 6.0,
                                                                  right: 5),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.lime,
                                                                size: 17,
                                                              ),
                                                              Text(
                                                                ratePark[index],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: 220,
                          width: 380,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "no favorite park yet.",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ],
                              )),
                        ),
                ],
              ),
            ),
            bottomNavigationBar: const HomeFooter())
        : Container(
            width: 80,
            height: 80,
            color: Colors.white,
            child: const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                  strokeWidth: 5,
                ),
              ),
            ),
          );
  }
}
