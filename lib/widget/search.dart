import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home/homepage_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _clearSearch() {
    _searchController.clear();
  }

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
          boxShadow: Styles.boxShadows,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search destination",
                  contentPadding: const EdgeInsets.fromLTRB(10, 2, 5, 9),
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                  ),
                  prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20, maxWidth: 40),
                  prefixIconColor: Colors.black,
                ),
                style: const TextStyle(fontFamily: 'Nunito', color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: _clearSearch,
              icon: Icon(
                Icons.clear,
                color: Colors.grey[500],
              ),
            ),
            IconButton(
              onPressed: () {
                print(_searchController.text.toString());
                firestore
                    .collection('checks')
                    .doc('state')
                    .update({'search': _searchController.text.toString()});
                _searchController.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                // Perform search functionality here
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

