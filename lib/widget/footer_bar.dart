import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/calendar/calendar_screen.dart';
import 'package:gogotrip/screens/favourite/favourite_screen.dart';
import 'package:gogotrip/screens/home/homepage_screen.dart';
import 'package:gogotrip/screens/profile/profile_screen.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              icon: Image.asset('assets/icons/home.png')),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
              },
              icon: Image.asset('assets/icons/like.png')),
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const AddPlaceScreen(),
          //           ));
          //     },
          //     icon: Image.asset('assets/icons/add.png')),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalendarScreen(),
                    ));
              },
              icon: Image.asset('assets/icons/calendar.png')),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              icon: Image.asset('assets/icons/person.png')),
        ],
      ),
    );
  }
}
