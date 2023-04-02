import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gogotrip/screens/party_room/widget/create_party_body.dart';
import 'package:gogotrip/screens/party_room/widget/create_party_header.dart';

class CreatePartyScreen extends StatefulWidget {
  const CreatePartyScreen({Key? key}) : super(key: key);

  @override
  State<CreatePartyScreen> createState() => _CreatePartyScreenState();
}

class _CreatePartyScreenState extends State<CreatePartyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/party_wallpaper.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CreatePartyHeader(),
                SizedBox(
                  height: 10,
                ),
                CreatePartyBody(),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
