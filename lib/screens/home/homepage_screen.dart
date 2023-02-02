import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/widget/home_body.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import 'package:gogotrip/screens/home/widget/home_header.dart';
import 'package:gogotrip/widget/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: const [
                HomeHeader(),
                SizedBox(height: 20),
                SearchBar(),
                HomeBody()
              ],
            ),
          ),
        ),
        bottomNavigationBar: const HomeFooter());
  }
}
