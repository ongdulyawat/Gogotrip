import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/widget/home_body.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import 'package:gogotrip/screens/login/login_screen.dart';
import 'package:gogotrip/screens/test_page/test_screen.dart';
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
        appBar: AppBar(
          backgroundColor: Styles.buttonColor,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 95.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dulyawat Visitruangrit",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                        Text(
                          "Location",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/beach.png"),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: Styles.boxShadows),
              )
            ],
          ),
        ),
        // appBar: AppBar(
        //     backgroundColor: Styles.buttonColor,
        //     shadowColor: Colors.transparent,
        //   title: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Dulyawat Visitruangrit",
        //         style: TextStyle(color: Colors.white, fontSize: 16.0),
        //       ),
        //       Text(
        //         "status",
        //         style: TextStyle(color: Colors.white, fontSize: 14.0),
        //       )
        //     ],
        //   ),
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left: 15.0),
        //     child: CircleAvatar(
        //       backgroundImage: AssetImage('assets/images/beach.png'),
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              // HomeHeader(),
              SizedBox(height: 20),
              SearchBar(),
              HomeBody()
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Styles.bgBackground,
            child: ListView(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Styles.buttonColor),
                  accountName: Text("Dulyawat Visitruangrit"),
                  accountEmail: Text("Dulyawat.wi@ku.th"),
                  currentAccountPicture: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/beach.png')),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book_online_outlined,
                  ),
                  title: const Text('Test'),
                  onTap: () {
                    Get.to(const TestPage());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.lock_outline_rounded,
                  ),
                  title: const Text('Lock out'),
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const HomeFooter());
  }
}
