import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 15),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: Styles.boxShadowBottonNav),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/home.png')),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/like.png')),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/add.png')),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/calendar.png')),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/person.png')),
        ],
      ),
    );
  }
}
