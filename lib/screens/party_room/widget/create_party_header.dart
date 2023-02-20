import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogotrip/screens/party_room/party_screen.dart';

class CreatePartyHeader extends StatefulWidget {
  const CreatePartyHeader({Key? key}) : super(key: key);

  @override
  State<CreatePartyHeader> createState() => _CreatePartyHeaderState();
}

class _CreatePartyHeaderState extends State<CreatePartyHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 245),
            child: Container(
              padding:
              const EdgeInsets.only(top: 34, left: 10, bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(const PartyScreen());
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28)),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
          ),
        )
      ],
    );
  }
}
