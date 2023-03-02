import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';
import 'package:gogotrip/screens/profile/widget/profile_body.dart';
import 'package:gogotrip/screens/profile/widget/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgBackground,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ProfileHeader(),
              SizedBox(height: 5),
              ProfileBody()
            ],
          ),
        ),
        bottomNavigationBar: const HomeFooter());
  }
}
