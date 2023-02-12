import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';
import 'package:gogotrip/screens/party_room/create_party_screen.dart';

class PartyHeader extends StatefulWidget {
  const PartyHeader({Key? key}) : super(key: key);

  @override
  State<PartyHeader> createState() => _PartyHeaderState();
}

class _PartyHeaderState extends State<PartyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      // width: 376,
      // height:300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 245),
              child: Container(
                padding: EdgeInsets.only(top: 34, left: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              padding: EdgeInsets.only(top: 65,right: 18),
              child: GestureDetector(
                onTap: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePartyScreen(),
                        ));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Styles.buttonCreateColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exposure_plus_1,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "create",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
