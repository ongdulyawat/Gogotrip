import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyBody extends StatefulWidget {
  const PartyBody({Key? key}) : super(key: key);

  @override
  State<PartyBody> createState() => _PartyBodyState();
}

class _PartyBodyState extends State<PartyBody> {
  int loopUser = 6;
  List colorUser = [
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.9,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int num = 1; num < 8; num++)
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
            child: Container(
              width: 315,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: Styles.boxShadows,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 30),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                boxShadow: Styles.boxShadows,
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.business_center,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 210),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Styles.buttonColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.input,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "Join",
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
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 30),
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/beach.png'),
                                  fit: BoxFit.fill),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: Styles.boxShadows,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "30 October",
                              style: GoogleFonts.bebasNeue(fontSize: 30),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time ",
                                  style: GoogleFonts.bebasNeue(fontSize: 20),
                                ),
                                const Text("12.00 - 14.00"),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Room for women!",
                              style: GoogleFonts.poppins(fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 25),
                          child: Row(
                            children: [
                              for (int count = 0; count < loopUser; count++)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: colorUser[count],
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: Styles.boxShadows,
                                    ),
                                    child: const Icon(
                                      Icons.person_2_outlined,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 90),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "B",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("6 / 6", style: TextStyle(fontSize: 10)),
                            const Padding(
                              padding: EdgeInsets.only(left: 2.0, bottom: 2),
                              child: Icon(
                                Icons.person,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
