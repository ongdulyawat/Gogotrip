import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/user_model.dart';
import 'package:gogotrip/screens/home/widget/home_body.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import 'package:gogotrip/screens/login/login_screen.dart';
import 'package:gogotrip/widget/search.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();
  double? lat;
  double? long;
  String street = "";
  late Position position;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    getCurrentLocation();
    getaddress();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      lat = geoposition.latitude;
      long = geoposition.longitude;
      getaddress();
    });
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getaddress() async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat!, long!);
    setState(() {
      street = placemark[0].street!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgBackground1,
        appBar: AppBar(
          backgroundColor: Styles.bgBackground1,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      "${loggedInUser.username}",
                      style: GoogleFonts.deliusUnicase(textStyle: TextStyle(color: Colors.black, fontSize: 16.0)),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SizedBox(
                          width: 230,
                          height: 25,
                          child: Text(
                            street == null ? "Getting Address.." : "${street}",
                            style: GoogleFonts.deliusUnicase(
                                textStyle: TextStyle(
                                    color: Colors.black, fontSize: 14.0)),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 35,
                width: 35,
                decoration: '${loggedInUser.image}' == '-'
                    ? BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/user.png'),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Styles.boxShadows)
                    : BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${loggedInUser.image}'),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Styles.boxShadows),
              )
            ],
          ),
        ),
        // appBar: AppBar(
        body: SingleChildScrollView(
          child: Column(
            children: const [SizedBox(height: 20), SearchBar(), HomeBody()],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Styles.bgBackground1,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Styles.buttonColor),
                  accountName: Text(
                      "${loggedInUser.firstname} ${loggedInUser.lastname}"),
                  accountEmail: Text("${loggedInUser.email}"),

                  currentAccountPicture: '${loggedInUser.image}' == '-'
                      ? const CircleAvatar(
                          foregroundImage: AssetImage('assets/images/user.png'))
                      : CircleAvatar(
                          foregroundImage:
                              NetworkImage('${loggedInUser.image}'),
                        ),
                  //),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.lock_outline_rounded,
                  ),
                  title: const Text('Lock out'),
                  onTap: () {
                    // signUserOut();
                    FirebaseAuth.instance.signOut();
                    Get.to(const LoginScreen());
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const HomeFooter());
  }
}
