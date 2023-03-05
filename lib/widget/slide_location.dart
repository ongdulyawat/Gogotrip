import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideLocation extends StatefulWidget {
  const SlideLocation({Key? key}) : super(key: key);

  @override
  State<SlideLocation> createState() => _SlideLocationState();
}

class _SlideLocationState extends State<SlideLocation> {
  final List<String> locationlists = [
    "Beach",
    "Temple",
    "Restaurant",
    "Park",
    "Cafe",
  ];

  String selectItem = 'Beach';
  int count = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        color: Styles.bgBackground,
        width: MediaQuery.of(context).size.width - 20.0,
        height: 55.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...locationlists.map((e) {
              count++;
              if (count <= 3) {
                return _buildTypes(e, count);
              } else {
                count = 0;
                return _buildTypes(e, count);
              }
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildTypes(location, count) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectItem = location;

              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: location == selectItem
                      ? Styles.buttonColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: Styles.boxShadows),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: Styles.boxShadows),
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Image.asset(
                          'assets/icons/beach.png',
                          height: 25,
                          width: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.poppins(
                          color: location == selectItem
                              ? Colors.white
                              : Colors.black,
                          fontWeight: location == selectItem
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: location == selectItem
                    ? Styles.buttonColor
                    : Colors.transparent),
          )
        ],
      ),
    );
  }
}
