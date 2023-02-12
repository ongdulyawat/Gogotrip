import 'package:flutter/material.dart';

class Styles{
  static const Color bgBackground = Color.fromRGBO(251, 237, 249, 1);
  static const Color buttonColor = Color.fromRGBO(220, 171, 171, 1);
  static const Color buttonCreateColor = Color.fromRGBO(0, 181, 7, 1);

  static var boxShadows = [
    const BoxShadow(
      color: Colors.black12,
      spreadRadius: 0.1,
      blurRadius: 3,
      offset: Offset(0, 2), // changes position of shadow
    ),
  ];

  static var boxShadowBottonNav = [
    const BoxShadow(
      color: Styles.bgBackground,
      blurRadius: 35,
      offset: Offset(0, -10), // changes position of shadow
    ),
  ];
}