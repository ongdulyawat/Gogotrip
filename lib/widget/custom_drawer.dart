import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // List<ScreenHiddenDrawer> _page = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _page = [ScreenHiddenDrawer(ItemHiddenMenu(
  //       name: 'Log out',
  //       baseStyle: TextStyle(),
  //       selectedStyle: TextStyle()
  //   ), LoginScreen())
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    // return HiddenDrawerMenu(screens: _page,initPositionSelected: 0, backgroundColorMenu: Colors.pinkAccent);
    return Container(
      color: Styles.bgBackground,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/beach.png'))),
          )
        ],
      ),
    );
  }
}
