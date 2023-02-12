import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class CreatePartyScreen extends StatefulWidget {
  const CreatePartyScreen({Key? key}) : super(key: key);

  @override
  State<CreatePartyScreen> createState() => _CreatePartyScreenState();
}

class _CreatePartyScreenState extends State<CreatePartyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgBackground,
    );
  }
}
