import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LocationCard extends StatefulWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  Map<dynamic, dynamic>? data;
  List<bool> check = [false];
  String Beach = "ทะเล";
  String temple = "วัด";
  String restaurant = "อาหาร";
  String park = "สวนสาธารณะ";
  String cafe = "cafe";

  @override
  void initState() {
    super.initState();
    getData();
  }

  clickButton() {
    // setState(() {
    //   check[num] = !check[num];
    // });
  }

  Future<String> getData() async {
    final String apiKey =
        "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
    var urlBeach = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$Beach&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlTemple = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$temple&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=30&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlRestaurant = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$restaurant&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=30&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlPark = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$park&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=30&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlCafe = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$cafe&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=30&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var response = await http.get(
      urlTemple,
      headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      setState(() {
        data = jsonResponse;
      });
    }
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    //   return Container(
    //     height: 200,
    //     child: ListView(
    //       scrollDirection: Axis.horizontal,
    //       children: <Widget>[
    //         _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangkhen',
    //             '4.0', Colors.white),
    //         _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangkhen',
    //             '4.0', Colors.white),
    //         _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangken',
    //             '4.0', Colors.white)
    //       ],
    //     ),
    //   );
    // }
    //
    // _buildListItem(String locationName, String imgPath, String map, String rating,
    //     Color cardColor) {
    //   return Padding(
    //     padding: const EdgeInsets.only(left: 15),
    //     child: InkWell(
    //       onTap: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const DetailScreen(),
    //             ));
    //       },
    //       child: Container(
    //         height: 175,
    //         width: 150,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(15),
    //             color: cardColor,
    //             boxShadow: Styles.boxShadows),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Hero(
    //                 tag: locationName,
    //                 child: Container(
    //                   height: 95,
    //                   width: 95,
    //                   decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: AssetImage(imgPath), fit: BoxFit.fill),
    //                       color: Colors.white,
    //                       shape: BoxShape.rectangle,
    //                       borderRadius: BorderRadius.circular(15),
    //                       boxShadow: Styles.boxShadows),
    //                 )),
    //             const SizedBox(height: 10),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 16.0),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     flex: 65,
    //                     child: Text(
    //                       locationName,
    //                       style: const TextStyle(fontSize: 17),
    //                     ),
    //                   ),
    //                   Expanded(
    //                     flex: 35,
    //                     child: GestureDetector(
    //                       onTap: () {},
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: Container(
    //                           // padding: const EdgeInsets.all(8),
    //                           width: 30,
    //                           height: 30,
    //                           decoration: BoxDecoration(
    //                             color: Colors.red,
    //                             borderRadius: BorderRadius.circular(28),
    //                             boxShadow: Styles.boxShadows,
    //                           ),
    //                           child: const Icon(
    //                             Icons.heart_broken,
    //                             size: 15,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 15.0),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     flex: 65,
    //                     child: Text(
    //                       map,
    //                       style: const TextStyle(fontSize: 17),
    //                     ),
    //                   ),
    //                   Expanded(
    //                     flex: 35,
    //                     child: Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.star,
    //                           size: 15,
    //                         ),
    //                         Text(
    //                           rating,
    //                           style: const TextStyle(fontSize: 17),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
    //........................................................................
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     for (int count = 0; count < _data?["result"].length; count++)
    //       Padding(
    //         padding: const EdgeInsets.only(left: 15),
    //         child: InkWell(
    //           onTap: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => const DetailScreen(),
    //                 ));
    //           },
    //           child: Container(
    //             height: 175,
    //             width: 150,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(15),
    //                 color: Colors.white,
    //                 boxShadow: Styles.boxShadows),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Hero(
    //                     tag: Text("${_data?['result'][count]['place_name']}"),
    //                     child: Container(
    //                       height: 95,
    //                       width: 95,
    //                       decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: NetworkImage(
    //                                   "${_data?['result'][count]['thumbnail_url']}"),
    //                               fit: BoxFit.fill),
    //                           color: Colors.white,
    //                           shape: BoxShape.rectangle,
    //                           borderRadius: BorderRadius.circular(15),
    //                           boxShadow: Styles.boxShadows),
    //                     )),
    //                 const SizedBox(height: 10),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 16.0),
    //                   child: Row(
    //                     children: [
    //                       Expanded(
    //                         flex: 65,
    //                         child: Text(
    //                           "${_data?['result'][count]['place_name']}",
    //                           style: const TextStyle(fontSize: 17),
    //                         ),
    //                       ),
    //                       Expanded(
    //                         flex: 35,
    //                         child: GestureDetector(
    //                           onTap: () {},
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Container(
    //                               // padding: const EdgeInsets.all(8),
    //                               width: 30,
    //                               height: 30,
    //                               decoration: BoxDecoration(
    //                                 color: Colors.red,
    //                                 borderRadius: BorderRadius.circular(28),
    //                                 boxShadow: Styles.boxShadows,
    //                               ),
    //                               child: const Icon(
    //                                 Icons.heart_broken,
    //                                 size: 15,
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 15.0),
    //                   child: Row(
    //                     children: [
    //                       Expanded(
    //                         flex: 65,
    //                         child: Text(
    //                           "${_data?['result'][count]['location']}",
    //                           style: const TextStyle(fontSize: 17),
    //                         ),
    //                       ),
    //                       Expanded(
    //                         flex: 35,
    //                         child: Row(
    //                           children: [
    //                             const Icon(
    //                               Icons.star,
    //                               size: 15,
    //                             ),
    //                             Text(
    //                               "4",
    //                               style: const TextStyle(fontSize: 17),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       )
    //   ],
    // );

    // return Column(
    //   children: [
    //     for (int count = 0; count < _data?["result"].length; count++)
    //     ListTile(
    //       title: Text("${_data?['result'][count]['place_id']}"),
    //       subtitle: Text("${_data?['result'][count]['place_name']}"),
    //     ),
    //     // Image.network("${_data?['result'][count]['thumbnail_url']}")
    //   ],
    // );

    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     for (int count = 0; count < _data?["result"].length; count++)
    //     Container(
    //       height: 175,
    //       width: 150,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           color: Colors.white,
    //           boxShadow: Styles.boxShadows),
    //       child: Column(
    //         children: [
    //             Text("${_data?['result'][count]['place_id']}")
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    return Container(
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data?["result"].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          data: null,
                          // data: "${_data?['result'][index]['place_id']}"
                        ),
                      ));
                },
                child: Container(
                  width: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: Styles.boxShadows),
                  child: Column(
                    children: [
                      Text("${data?['result'][index]['place_id']}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 105,
                        width: 125,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: data?['result'][index]
                                            ['thumbnail_url'] !=
                                        null
                                    ? NetworkImage(
                                        "${data?['result'][index]['thumbnail_url']}",
                                      )
                                    : AssetImage("assets/images/beach.png")
                                        as ImageProvider,
                                fit: BoxFit.fill),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: Styles.boxShadows),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0, right: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "${data?['result'][index]['place_name']}",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${data?['result'][index]['destination']}",
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, right: 5),
                                  child: Column(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.lime,
                                        size: 17,
                                      ),
                                      Text(
                                        "4.0",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // clickButton();
                                    setState(() {
                                      check[index] = !check[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 5),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: check == false
                                            ? Colors.white
                                            : Colors.red,
                                        borderRadius: BorderRadius.circular(28),
                                        boxShadow: Styles.boxShadows,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: check == false
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
