
import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class testOng extends StatefulWidget {
  const testOng({Key? key}) : super(key: key);

  @override
  State<testOng> createState() => _testOngState();
}

class _testOngState extends State<testOng> {
  String country = "";
  String name = "";
  String street = "";
  String postalCode = "";
  double? lat;
  double? long;
  String add1 = '';
  String add2 = '';
  var address = 'Getting Address..'.obs;
  Position? position ;


  @override
  void initState() {
    super.initState();
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

  // Future<void>getAddress(Position position) async{
  //   List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemark[0];
  //   address.value = 'Address : ${place.locality},${place.country}';
  // }
  Future<void>getaddress() async{
    List<Placemark> placemark = await placemarkFromCoordinates(lat!,long!);
    setState(() {
      country = placemark[0].country!;
      name = placemark[0].name!;
      street = placemark[0].street!;
      postalCode = placemark[0].postalCode!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${lat}"),
          Text("${long}"),
          Text("${country}"),
          Text("${name}"),
          Text("${street}"),
          Text("${postalCode}"),
          // Text(_currentAddress);
        ],
      ),
    );
  }

  // var latitude = 'Getting latitude..'.obs;
  // var longtitude = 'Getting longtitude..'.obs;
  // var address = 'Getting address..'.obs;
  // late StreamSubscription<Position> streamSubscription;
  //
  // @override
  // void onInit() async{
  //   getLocation();
  // }
  //
  // getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   print(address.value);
  //   print(latitude.value);
  //   print(longtitude.value);
  //   streamSubscription = Geolocator.getPositionStream().listen((Position position) {
  //    latitude.value = "latitude: ${position.latitude}";
  //    longtitude.value = "longtitude: ${position.latitude}";
  //    getAddress(position);
  //    print(address.value);
  //    print(latitude.value);
  //    print(longtitude.value);
  //   });
  //
  //
  // }
  //
  //
  // Future<void>getAddress(Position position) async{
  //   List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemark[0];
  //   address.value = 'Address : ${place.locality},${place.country}';
  //   print(address.value);
  //   print(latitude.value);
  //   print(longtitude.value);
  // }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(latitude.value),
  //         Text(longtitude.value),
  //         Text(address.value)
  //         // Text(_currentAddress);
  //       ],
  //     ),
  //   );
  // }

}



