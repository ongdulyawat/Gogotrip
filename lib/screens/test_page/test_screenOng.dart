import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class testOng extends StatefulWidget {
  const testOng({Key? key}) : super(key: key);

  @override
  State<testOng> createState() => _testOngState();
}

class _testOngState extends State<testOng> {
  // String country = "";
  // String name = "";
  // String street = "";
  // String postalCode = "";
  // double? lat;
  // double? long;
  // String add1 = '';
  // String add2 = '';
  // var address = 'Getting Address..'.obs;
  // Position? position ;
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentLocation();
  //   getaddress();
  // }
  // getCurrentLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //   final geoposition = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   setState(() {
  //     lat = geoposition.latitude;
  //     long = geoposition.longitude;
  //     getaddress();
  //   });
  //
  // }
  // Future<void>getaddress() async{
  //   List<Placemark> placemark = await placemarkFromCoordinates(lat!,long!);
  //   setState(() {
  //     country = placemark[0].country!;
  //     name = placemark[0].name!;
  //     street = placemark[0].locality!;
  //     postalCode = placemark[0].postalCode!;
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text("${lat}"),
  //         Text("${long}"),
  //         Text("${country}"),
  //         Text("${name}"),
  //         Text("${street}"),
  //         Text("${postalCode}"),
  //         // Text(_currentAddress);
  //       ],
  //     ),
  //   );
  // }

  Map<dynamic,dynamic>? _data;
  var _newCase = 0;

  // final String apiKey = "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
  // final String accessToken = "dulyawat.tourismthailand.com";
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<String> getData() async {
    final String apiKey =
        "Gy)g(ZH9sJk7V6)7kxxmavBQ9BOHToVYeNBnpCEMK)3YzerR7YQMqZ3YnazuaeL(lm6w7Pr52oyQfuFYgcCvowW=====2";
    // final String accessToken = "dulyawat.tourismthailand.com";
    var url = Uri.parse('https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=10&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2023/02/28');
        // 'tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=10&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2021/12/31');
    var response = await http.get(
      url,
      // authorization: { },
      headers: {
        // HttpHeaders.authorizationHeader: apiKey,
        'Authorization' : "Bearer ${apiKey}",
        'Accept-Language': 'TH'
      },
    );
    // final responseJson = jsonDecode(response.body);
    // print(responseJson);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      setState(() {
        _data = jsonResponse;

      });
    }
    return "success";
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Test get api"),
  //     ),
  //     body: Container(
  //        child: Column(
  //          children: [
  //            Text("เเบบ 1: ${_newCase}"), //สำหรับกรณีน้อยๆ
  //            Text("เเบบ 2: ${_data[0]['new_case'] ?? ''}"),  //สำหรับกรณีเรียกหลายarray
  //          ],
  //        ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test get api"),
        ),
        body: ListView.builder(
            itemCount:_data == null?0:_data?["result"].length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text("${_data?['result'][index]['place_id']}"),
                    subtitle: Text("${_data?['result'][index]['place_name']}"),
                  ),
                  Image.network("${_data?['result'][index]['thumbnail_url']}")
                ],
              );
            }));
  }
}


// itemCount: _data == null?0:_data?["result"].length,