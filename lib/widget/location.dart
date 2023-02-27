import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String lat = "";
  String long = "";

  @override
  void initState() {
    super.initState();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      lat = "${geoposition.latitude}";
      long = "${geoposition.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(lat), Text(long)],
    );
  }
}
