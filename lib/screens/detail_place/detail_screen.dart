import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gogotrip/screens/detail_place/widget/detail_body.dart';
import 'package:gogotrip/screens/detail_place/widget/detail_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required dynamic data}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background:AssetImage("assets/images/beach.png") as ImageProvider ,
      // appBar: ,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/beach.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Column(
            children: [DetailHeader(), SizedBox(height: 20), DetailBody()],
          ),
        ),
      ),
    );
  }
}
