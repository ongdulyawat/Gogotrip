import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/beach_model.dart';
import 'package:gogotrip/controllers/cafe_model.dart';
import 'package:gogotrip/controllers/park_model.dart';
import 'package:gogotrip/controllers/restaurant_model.dart';
import 'package:gogotrip/controllers/temple_model.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LocationCard extends StatefulWidget {

  LocationCard({Key? key}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();

}

class _LocationCardState extends State<LocationCard> {

  //TempleCheck? templeCheck = FirebaseFirestore.instance;
  TempleModel sameTempleCheck = TempleModel();
  ParkModel   sameParkCheck = ParkModel();
  CafeModel   sameCafeCheck = CafeModel();

  Map<dynamic, dynamic>? data;
  bool check = false;
  // String Beach = "ทะเล";
  // String temple = "วัด";
  // String restaurant = "อาหาร";
  // String park = "สวนสาธารณะ";
  // String cafe = "cafe";

  Map<dynamic, dynamic>? dataDetail;
  // List<bool> checkDetail = [false];
  // String BeachDetail = "ทะเล";
  // String templeDetail = "วัด";
  // String restaurantDetail = "อาหาร";
  // String parkDetail = "สวนสาธารณะ";
  // String cafeDetail = "cafe";

  final CollectionReference checkCollection = FirebaseFirestore.instance.collection('checks');

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
   getDataFromPlace() async {
    final DocumentSnapshot snapshot = await checkCollection.doc('state').get();

    if (snapshot.exists) {
      setState(() {
        place = snapshot.get('place');
        placeClose = snapshot.get('placeClose');
        placeId = snapshot.get('placeId');
        placeInfo = snapshot.get('placeInfo');
        placeName = snapshot.get('placeName');
        placeOpen = snapshot.get('placeOpen');
        placeUrl = snapshot.get('placeUrl');
        detailReload = snapshot.get('detailReload');
        print("Testtt"+place);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(Duration(milliseconds: 1000), () {
      getData();
   });
    // FirebaseFirestore.instance
    //     .collection('temples')
    //     .doc()
    //     //.where('placeId',isEqualTo : data?['result'][index]['place_id'])
    //     .get()
    //     .then((value) {
    //   this.sameTempleCheck = TempleModel.fromMap(value.data());
    //   setState(() {});
    // });
    // FirebaseFirestore.instance
    //     .collection('parks')
    //     .doc()
    //     .get()
    //     .then((value) {
    //   this.sameParkCheck = ParkModel.fromMap(value.data());
    //   setState(() {});
    // });
  }

  clickButton() {
    // setState(() {
    //   check[num] = !check[num];
    // });
  }


  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // Future<void> getPlaceValue() async {
  //   DocumentSnapshot snapshot = await firebaseFirestore.collection('checks').doc('state').get();
  //   String place = snapshot.get('place');
  //   print(place);
  // }

  Future<String> getData() async {
    final String apiKey = await
        "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
    var urlBeach = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=ทะเล&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlTemple = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=วัด&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlRestaurant = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var urlPark = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=สวนสาธารณะ&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlCafe = await Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=cafe&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=6&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var detailUrlBeach =  Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/'+placeId);
    var detailUrlTemple =  Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/'+placeId);
    var detailUrlRestaurant =  Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/sha/'+placeId);
    var detailUrlPark =  Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/attraction/'+placeId);
    var detailUrlCafe =  Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/restaurant/'+placeId);

    //print("Test"+widget.locations);
    print("HelloTest"+place);
    if (place == "Temple") {
      print("qqqqqqqq");
      var response = await http.get(
        urlTemple,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      var responseInfo = await http.get(
        detailUrlTemple,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

    if (response.statusCode == 200) {
      var jsonResponse = await convert.jsonDecode(response.body);
      print(jsonResponse);
      setState(() {
        data = jsonResponse;
      });
    }
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
    }

    else if ( place == "Beach") {
      print("kkkkkkkkkkkk");
      var response = await http.get(
        urlBeach,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      var responseInfo = await http.get(
        detailUrlBeach,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
    }


    else if ( place == "Restaurant") {
      var response = await http.get(
        urlRestaurant,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );
      var responseInfo = await http.get(
        detailUrlRestaurant,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
    }


    else if ( place == "Park") {
      var response = await http.get(
        urlPark,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      var responseInfo = await http.get(
        detailUrlPark,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          data = jsonResponse;
        });
      }

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
    }
    else{
      print("cafe"+place);
      var response = await http.get(
        urlCafe,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      var responseInfo = await http.get(
        detailUrlCafe,
        headers: {'Authorization': "Bearer ${apiKey}", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseInfo.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseInfo.body);
        print(jsonResponse);
        setState(() {
          dataDetail = jsonResponse;
        });
      }
    }

    return "success";
  }

  //FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Container(
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data?["result"].length,
          //itemCount: dataDetail == null ? 0 : dataDetail?["result"].length,
          itemBuilder: (context, index) {
            // if({sameTempleCheck.placeId} != data?['result'][index]['place_id']){
            // TempleModel templeModel = TempleModel();
            // //templeModel.description = data?['result'][index]['place_id'];
            // templeModel.destination = data?['result'][index]['destination'];
            // templeModel.placeId = data?['result'][index]['place_id'];
            // templeModel.placeName = data?['result'][index]['place_name'];
            // templeModel.thumbnailUrl = data?['result'][index]['thumbnail_url'];
            // firebaseFirestore.collection("temples").doc().set(templeModel.toMap());
            // print("Hello+${sameTempleCheck.placeId}");
            // }
            // else if(!=data?['result'][index]['place_id'] && (restaurant == "อาหาร")){
              //RestaurantModel restaurantModel = RestaurantModel();
              //templeModel.description = data?['result'][index]['place_id'];
              // restaurantModel.destination = data?['result'][index]['destination'];
              // restaurantModel.placeId = data?['result'][index]['place_id'];
              // restaurantModel.placeName = data?['result'][index]['place_name'];
              // restaurantModel.thumbnailUrl = data?['result'][index]['thumbnail_url'];
              // firebaseFirestore.collection("restaurants").doc().set(restaurantModel.toMap());
            // }
            // else if(!=data?['result'][index]['place_id'] && (Beach == "ทะเล")){
            // BeachModel beachModel = BeachModel();
            // //templeModel.description = data?['result'][index]['place_id'];
            // beachModel.destination = data?['result'][index]['destination'];
            // beachModel.placeId = data?['result'][index]['place_id'];
            // beachModel.placeName = data?['result'][index]['place_name'];
            // beachModel.thumbnailUrl = data?['result'][index]['thumbnail_url'];
            // firebaseFirestore.collection("beaches").doc().set(beachModel.toMap());
            // }
            // else if({sameParkCheck.placeId}!=data?['result'][index]['place_id'] ){
            // ParkModel parkModel = ParkModel();
            // //templeModel.description = data?['result'][index]['place_id'];
            // parkModel.destination = data?['result'][index]['destination'];
            // parkModel.placeId = data?['result'][index]['place_id'];
            // parkModel.placeName = data?['result'][index]['place_name'];
            // parkModel.thumbnailUrl = data?['result'][index]['thumbnail_url'];
            // firebaseFirestore.collection("parks").doc().set(parkModel.toMap());
            // }
            // else if(!=data?['result'][index]['place_id'] && (cafe == "cafe")){
            // CafeModel cafeModel = CafeModel();
            // //templeModel.description = data?['result'][index]['place_id'];
            // cafeModel.destination = data?['result'][index]['destination'];
            // cafeModel.placeId = data?['result'][index]['place_id'];
            // cafeModel.placeName = data?['result'][index]['place_name'];
            // cafeModel.thumbnailUrl = data?['result'][index]['thumbnail_url'];
            // firebaseFirestore.collection("cafes").doc().set(cafeModel.toMap());
            // }
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: InkWell(

                onTap: ()
              {
                firestore.collection('checks').doc('state').update({
                  'detailReload': 'False'
                });
              firestore.collection('checks').doc('state').update({
                'placeId': '${data?['result'][index]['place_id']}'
              });
              firestore.collection('checks').doc('state').update({
                'placeName': '${data?['result'][index]['place_name']}'
              });
              firestore.collection('checks').doc('state').update({
                'placeUrl': '${data?['result'][index]['thumbnail_url']}'
              });


                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const DetailScreen(
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
                                        ''
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
                                      check = !check;
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
