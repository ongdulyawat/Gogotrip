// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gogotrip/constants/styles.dart';
// import 'package:gogotrip/controllers/beach_model.dart';
// import 'package:gogotrip/controllers/cafe_model.dart';
// import 'package:gogotrip/controllers/park_model.dart';
// import 'package:gogotrip/controllers/restaurant_model.dart';
// import 'package:gogotrip/controllers/temple_model.dart';
// import 'package:gogotrip/screens/detail_place/detail_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
//
// class LocationCard extends StatefulWidget {
//   const LocationCard({Key? key}) : super(key: key);
//
//   @override
//   State<LocationCard> createState() => _LocationCardState();
// }
//
// class _LocationCardState extends State<LocationCard> {
//   TempleModel sameTempleCheck = TempleModel();
//   ParkModel sameParkCheck = ParkModel();
//   CafeModel sameCafeCheck = CafeModel();
//
//   Map<dynamic, dynamic>? data;
//   bool check = false;
//
//   Map<dynamic, dynamic>? dataDetailSearch;
//
//   final CollectionReference checkCollection =
//       FirebaseFirestore.instance.collection('checks');
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   String place = '';
//   String placeId = '';
//   String placeInfo = '';
//   String placeClose = '';
//   String placeOpen = '';
//   String placeName = '';
//   String placeUrl = '';
//   String detailReload = '';
//   String search = '';
//
//   getDataFromPlace() async {
//     final DocumentSnapshot snapshot = await checkCollection.doc('state').get();
//
//     if (snapshot.exists) {
//       setState(() {
//         place = snapshot.get('place');
//         placeClose = snapshot.get('placeClose');
//         placeId = snapshot.get('placeId');
//         placeInfo = snapshot.get('placeInfo');
//         placeName = snapshot.get('placeName');
//         placeOpen = snapshot.get('placeOpen');
//         placeUrl = snapshot.get('placeUrl');
//         detailReload = snapshot.get('detailReload');
//         search = snapshot.get('search');
//       });
//     }
//   }
//
//   deleteSearch() {
//     firestore.collection('checks').doc('state').update({'search': ''});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getDataFromPlace();
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       getData();
//       getSearchData();
//     });
//     Future.delayed(const Duration(milliseconds: 1300), () {
//       deleteSearch();
//     });
//   }
//
//   Future<String> getData() async {
//     const String apiKey =
//         "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
//     var urlBeach = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=ทะเล&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlTemple = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=วัด&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlRestaurant = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//
//     var urlPark = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=สวนสาธารณะ&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlCafe = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=cafe&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//
//     var urlSearchBeach = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchTemple = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchRestaurant = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//
//     var urlSearchPark = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchCafe = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     if (place == "Temple") {
//       var response = await http.get(
//         urlTemple,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       var responseSearch = await http.get(
//         urlSearchTemple,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (response.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(response.body);
//         setState(() {
//           data = jsonResponse;
//         });
//       }
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Beach") {
//       var response = await http.get(
//         urlBeach,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       var responseSearch = await http.get(
//         urlSearchBeach,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (response.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(response.body);
//         setState(() {
//           data = jsonResponse;
//         });
//       }
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Restaurant") {
//       var response = await http.get(
//         urlRestaurant,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//       var responseSearch = await http.get(
//         urlSearchRestaurant,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (response.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(response.body);
//         setState(() {
//           data = jsonResponse;
//         });
//       }
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Park") {
//       var response = await http.get(
//         urlPark,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       var responseSearch = await http.get(
//         urlSearchPark,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (response.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(response.body);
//         setState(() {
//           data = jsonResponse;
//         });
//       }
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else {
//       var response = await http.get(
//         urlCafe,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       var responseSearch = await http.get(
//         urlSearchCafe,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (response.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(response.body);
//         setState(() {
//           data = jsonResponse;
//         });
//       }
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     }
//
//     return "success";
//   }
//
//   getSearchData() async {
//     const String apiKey =
//         "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
//
//     var urlSearchBeach = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchTemple = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchRestaurant = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//
//     var urlSearchPark = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//     var urlSearchCafe = Uri.parse(
//         'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
//
//     if (place == "Temple") {
//       var responseSearch = await http.get(
//         urlSearchTemple,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Beach") {
//       var responseSearch = await http.get(
//         urlSearchBeach,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Restaurant") {
//       var responseSearch = await http.get(
//         urlSearchRestaurant,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else if (place == "Park") {
//       var responseSearch = await http.get(
//         urlSearchPark,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     } else {
//       var responseSearch = await http.get(
//         urlSearchCafe,
//         headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
//       );
//
//       if (responseSearch.statusCode == 200) {
//         var jsonResponse = await convert.jsonDecode(responseSearch.body);
//         setState(() {
//           dataDetailSearch = jsonResponse;
//         });
//       }
//     }
//     return dataDetailSearch;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;
//     return search == ''
//         ? SizedBox(
//             height: 220,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: data == null ? 0 : data?["result"].length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 5.0, right: 5),
//                     child: InkWell(
//                       onTap: () {
//                         firestore
//                             .collection('checks')
//                             .doc('state')
//                             .update({'detailReload': 'False'});
//                         firestore.collection('checks').doc('state').update({
//                           'placeId': '${data?['result'][index]['place_id']}'
//                         });
//                         firestore.collection('checks').doc('state').update({
//                           'placeName': '${data?['result'][index]['place_name']}'
//                         });
//                         firestore.collection('checks').doc('state').update({
//                           'placeUrl':
//                               '${data?['result'][index]['thumbnail_url']}'
//                         });
//
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const DetailScreen(
//                                 data: null,
//                               ),
//                             ));
//                       },
//                       child: Container(
//                         width: 165,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.white,
//                             boxShadow: Styles.boxShadows),
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 105,
//                               width: 125,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: data?['result'][index]
//                                                   ['thumbnail_url'] !=
//                                               ''
//                                           ? NetworkImage(
//                                               "${data?['result'][index]['thumbnail_url']}",
//                                             )
//                                           : const AssetImage(
//                                                   "assets/images/no-pictures.png")
//                                               as ImageProvider,
//                                       fit: BoxFit.fill),
//                                   color: Colors.white,
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: Styles.boxShadows),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 3.0, right: 3),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "${data?['result'][index]['place_name']}",
//                                     style: GoogleFonts.deliusUnicase(
//                                         fontSize: 12,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold),
//                                     overflow: TextOverflow.clip,
//                                     maxLines: 1,
//                                     softWrap: true,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                           "${data?['result'][index]['destination']}",
//                                           style: GoogleFonts.deliusUnicase(
//                                             fontSize: 14,
//                                             color: Colors.black,
//                                           )),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           )
//         : SizedBox(
//             height: 220,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: dataDetailSearch == null
//                     ? 0
//                     : dataDetailSearch?["result"].length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 5.0, right: 5),
//                     child: InkWell(
//                       onTap: () {
//                         firestore
//                             .collection('checks')
//                             .doc('state')
//                             .update({'detailReload': 'False'});
//                         firestore.collection('checks').doc('state').update({
//                           'placeId':
//                               '${dataDetailSearch?['result'][index]['place_id']}'
//                         });
//                         firestore.collection('checks').doc('state').update({
//                           'placeName':
//                               '${dataDetailSearch?['result'][index]['place_name']}'
//                         });
//                         firestore.collection('checks').doc('state').update({
//                           'placeUrl':
//                               '${dataDetailSearch?['result'][index]['thumbnail_url']}'
//                         });
//
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const DetailScreen(
//                                 data: null,
//                                 // data: "${_data?['result'][index]['place_id']}"
//                               ),
//                             ));
//                       },
//                       child: Container(
//                         width: 165,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.white,
//                             boxShadow: Styles.boxShadows),
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 105,
//                               width: 125,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: dataDetailSearch?['result'][index]
//                                                   ['thumbnail_url'] !=
//                                               ''
//                                           ? NetworkImage(
//                                               "${dataDetailSearch?['result'][index]['thumbnail_url']}",
//                                             )
//                                           : const AssetImage(
//                                                   "assets/images/beach.png")
//                                               as ImageProvider,
//                                       fit: BoxFit.fill),
//                                   color: Colors.white,
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: Styles.boxShadows),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 3.0, right: 3),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     child: Text(
//                                       "${dataDetailSearch?['result'][index]['place_name']}",
//                                       style: GoogleFonts.deliusUnicase(
//                                           fontSize: 12,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold),
//                                       overflow: TextOverflow.clip,
//                                       maxLines: 1,
//                                       softWrap: true,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                           "${dataDetailSearch?['result'][index]['destination']}",
//                                           style: GoogleFonts.deliusUnicase(
//                                       fontSize: 14,
//                                       color: Colors.black,)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/controllers/beach_model.dart';
import 'package:gogotrip/controllers/cafe_model.dart';
import 'package:gogotrip/controllers/park_model.dart';
import 'package:gogotrip/controllers/restaurant_model.dart';
import 'package:gogotrip/controllers/temple_model.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LocationCard extends StatefulWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  TempleModel sameTempleCheck = TempleModel();
  ParkModel sameParkCheck = ParkModel();
  CafeModel sameCafeCheck = CafeModel();

  Map<dynamic, dynamic>? data;
  bool check = false;

  Map<dynamic, dynamic>? dataDetailSearch;

  final CollectionReference checkCollection =
  FirebaseFirestore.instance.collection('checks');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String place = '';
  String placeId = '';
  String placeInfo = '';
  String placeClose = '';
  String placeOpen = '';
  String placeName = '';
  String placeUrl = '';
  String detailReload = '';
  String search = '';

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
        search = snapshot.get('search');
      });
    }
  }

  deleteSearch() {
    firestore.collection('checks').doc('state').update({'search': ''});
  }

  @override
  void initState() {
    super.initState();
    getDataFromPlace();
    Future.delayed(const Duration(milliseconds: 1000), () {
      getData();
      getSearchData();
    });
    Future.delayed(const Duration(milliseconds: 1300), () {
      deleteSearch();
    });
  }

  Future<String> getData() async {
    const String apiKey =
        "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
    var urlBeach = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=ทะเล&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlTemple = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=วัด&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlRestaurant = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var urlPark = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=สวนสาธารณะ&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlCafe = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=cafe&location=13.6904831,100.5226014&categorycodes=ALL&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var urlSearchBeach = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchTemple = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchRestaurant = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var urlSearchPark = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchCafe = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    if (place == "Temple") {
      var response = await http.get(
        urlTemple,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      var responseSearch = await http.get(
        urlSearchTemple,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Beach") {
      var response = await http.get(
        urlBeach,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      var responseSearch = await http.get(
        urlSearchBeach,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Restaurant") {
      var response = await http.get(
        urlRestaurant,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );
      var responseSearch = await http.get(
        urlSearchRestaurant,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Park") {
      var response = await http.get(
        urlPark,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      var responseSearch = await http.get(
        urlSearchPark,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        setState(() {
          data = jsonResponse;
        });
      }

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else {
      var response = await http.get(
        urlCafe,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      var responseSearch = await http.get(
        urlSearchCafe,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(response.body);
        setState(() {
          data = jsonResponse;
        });
      }
      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    }

    return "success";
  }

  getSearchData() async {
    const String apiKey =
        "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";

    var urlSearchBeach = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchTemple = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchRestaurant = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    var urlSearchPark = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=ATTRACTION&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
    var urlSearchCafe = Uri.parse(
        'https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=$search&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=20&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');

    if (place == "Temple") {
      var responseSearch = await http.get(
        urlSearchTemple,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Beach") {
      var responseSearch = await http.get(
        urlSearchBeach,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Restaurant") {
      var responseSearch = await http.get(
        urlSearchRestaurant,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else if (place == "Park") {
      var responseSearch = await http.get(
        urlSearchPark,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    } else {
      var responseSearch = await http.get(
        urlSearchCafe,
        headers: {'Authorization': "Bearer $apiKey", 'Accept-Language': 'TH'},
      );

      if (responseSearch.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(responseSearch.body);
        setState(() {
          dataDetailSearch = jsonResponse;
        });
      }
    }
    return dataDetailSearch;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return search == ''
        ? SizedBox(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data?["result"].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: InkWell(
                onTap: () {
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'detailReload': 'False'});
                  firestore.collection('checks').doc('state').update({
                    'placeId': '${data?['result'][index]['place_id']}'
                  });
                  firestore.collection('checks').doc('state').update({
                    'placeName': '${data?['result'][index]['place_name']}'
                  });
                  firestore.collection('checks').doc('state').update({
                    'placeUrl':
                    '${data?['result'][index]['thumbnail_url']}'
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          data: null,
                        ),
                      ));
                },
                child: Container(
                  width: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: Styles.boxShadows,
                    image: DecorationImage(
                        image: data?['result'][index]
                        ['thumbnail_url'] !=
                            ''
                            ? NetworkImage(
                          "${data?['result'][index]['thumbnail_url']}",
                        )
                            : const AssetImage(
                            "assets/images/no-pictures.png")
                        as ImageProvider,
                        fit: BoxFit.fill),),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 125,
                      ),
                      Container(
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Styles.bgBackground1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data?['result'][index]['place_name']}",
                                style: GoogleFonts.deliusUnicase(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                  Text(
                                      "${data?['result'][index]['destination']}",
                                      style: GoogleFonts.deliusUnicase(
                                        fontSize: 14,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    )
        : SizedBox(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataDetailSearch == null
              ? 0
              : dataDetailSearch?["result"].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: InkWell(
                onTap: () {
                  firestore
                      .collection('checks')
                      .doc('state')
                      .update({'detailReload': 'False'});
                  firestore.collection('checks').doc('state').update({
                    'placeId':
                    '${dataDetailSearch?['result'][index]['place_id']}'
                  });
                  firestore.collection('checks').doc('state').update({
                    'placeName':
                    '${dataDetailSearch?['result'][index]['place_name']}'
                  });
                  firestore.collection('checks').doc('state').update({
                    'placeUrl':
                    '${dataDetailSearch?['result'][index]['thumbnail_url']}'
                  });

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
                      boxShadow: Styles.boxShadows,
                      image: DecorationImage(
                          image: dataDetailSearch?['result'][index]
                          ['thumbnail_url'] !=
                              ''
                              ? NetworkImage(
                            "${dataDetailSearch?['result'][index]['thumbnail_url']}",
                          )
                              : const AssetImage(
                              "assets/images/beach.png")
                          as ImageProvider,
                          fit: BoxFit.fill)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 125,
                      ),
                      Container(
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Styles.bgBackground1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "${dataDetailSearch?['result'][index]['place_name']}",
                                  style: GoogleFonts.deliusUnicase(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                  Text(
                                      "${dataDetailSearch?['result'][index]['destination']}",
                                      style: GoogleFonts.deliusUnicase(
                                        fontSize: 14,
                                        color: Colors.black,)),
                                ],
                              ),
                            ],
                          ),
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
