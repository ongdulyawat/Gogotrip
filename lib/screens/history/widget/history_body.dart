import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
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
      childAspectRatio: 2.2,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int num = 0; num < 10; num++)
          // for(int numArray = 0; numArray < 6 ; numArray++)
          Column(
            children: [
              Container(
                width: 300,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  boxShadow: Styles.boxShadows,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, left: 30),
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/beach.png'),
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
                                // DateFormat.yMMMMd().format(dataList[num].value[0].toDate()),
                                "30 October",
                                style: GoogleFonts.bebasNeue(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time ",
                                    style:
                                        GoogleFonts.bebasNeue(fontSize: 20),
                                  ),
                                  // Text(dataList[num].value[1]+"-"+dataList[num].value[2]),
                                  Text("12.00 - 14.00"),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              // Text(dataList[num].value[5],
                              Text(
                                "text",
                                style: GoogleFonts.poppins(fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 22),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Container(
                              child: Row(
                                children: [
                                  for (int count = 0; count < 6; count++)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: colorUser[count],
                                          borderRadius:
                                              BorderRadius.circular(24),
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
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                  Text("6/6", style: TextStyle(fontSize: 10)),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.0, bottom: 2),
                                    child: Icon(
                                      Icons.person,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 302,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  boxShadow: Styles.boxShadows,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("Success! Thanks for join us",style: TextStyle(color: Colors.white,fontSize: 10)),
                    )
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
