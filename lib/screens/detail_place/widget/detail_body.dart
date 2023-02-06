import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gogotrip/constants/styles.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 70,
                  child: Text(
                    "Kasetsart",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 35.0, top: 5, bottom: 5, right: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Styles.buttonColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.meeting_room,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "party",
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
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 86,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                    child: Row(
                      children: const [
                        Text(
                          "Open ",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text("8.00 ,", style: TextStyle(fontSize: 12)),
                        Text(" Close ", style: TextStyle(fontSize: 12)),
                        Text("18.00", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 14,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.star_rate_sharp,
                        size: 15,
                        color: Colors.amber,
                      ),
                      // SizedBox(width: 2),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          "4.0",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "tap here to rate: ",
                  style: TextStyle(fontSize: 10),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.only(right: 1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "________________________",
                    style: TextStyle(color: Colors.grey),
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
