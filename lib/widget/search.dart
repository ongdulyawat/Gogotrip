import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: Styles.boxShadows),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: "Search destination",
              contentPadding: const EdgeInsets.fromLTRB(10, 2, 5, 9),
              hintStyle:
                  GoogleFonts.poppins(fontSize: 15, color: Colors.grey[500]),
              border: InputBorder.none,
              fillColor: Colors.white,
              prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  )),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20, maxWidth: 40),
              prefixIconColor: Colors.black),
          style: const TextStyle(fontFamily: 'Nunito', color: Colors.black),
        ),
      ),
    );
  }
}
