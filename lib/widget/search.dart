import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

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
        child: const TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: "Search destination",
              contentPadding: EdgeInsets.fromLTRB(10, 2, 5, 12),
              hintStyle: TextStyle(
                  fontFamily: 'Nunito', fontSize: 18, color: Colors.black),
              border: InputBorder.none,
              fillColor: Colors.white,
              prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, maxWidth: 40),
              prefixIconColor: Colors.black),
          style: TextStyle(fontFamily: 'Nunito', color: Colors.black),
        ),
      ),
    );
  }
}
