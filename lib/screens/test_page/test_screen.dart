import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:gogotrip/constants/styles.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);


  @override
  State<TestPage> createState() => _TestPageState();



}

void getData() async {
  //final tatApiKey = 'GTv3Mhi54CdEg2WhvksJwoF76XO2EgCGyAQQXk9I)uLciKSVA1Pdn33AkZjhZnGfa22lPC9gNDC1ZYTnBEIp21G=====2';
  
  final url = Uri.parse("https://tatapi.tourismthailand.org/tatapi/v5/places/search?keyword=อาหาร&location=13.6904831,100.5226014&categorycodes=RESTAURANT&provinceName=Bangkok&radius=20&numberOfResult=10&pagenumber=1&destination=Bangkok&filterByUpdateDate=2019/09/01-2021/12/31");
  http.Response response = await http.get(url);

  print(response.statusCode);
}

class _TestPageState extends State<TestPage> {

  // @override
  // void initState() {
  //   super.initState();
  //   String apiKey = "GTv3Mhi54CdEg2WhvksJwoF76XO2EgCGyAQQXk9I)uLciKSVA1Pdn33AkZjhZnGfa22lPC9gNDC1ZYTnBEIp21G=====2";
  //   TATSDKEnvironment.setEnvironment(apiKey, this);
  // }

  // List trendingmovies = [];
  // final String apikey = 'GTv3Mhi54CdEg2WhvksJwoF76XO2EgCGyAQQXk9I)uLciKSVA1Pdn33AkZjhZnGfa22lPC9gNDC1ZYTnBEIp21G=====2';
  // final readaccesstoken = '';
  //
  // loadmovies() async{
  //
  // }

  @override
  Widget build(BuildContext context) {

    getData();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("API TTT"),
        ),
      ),
    );

  }

  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  //
  //
  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _usernameController,
  //                 decoration: const InputDecoration(labelText: 'username'),
  //               ),
  //               TextField(
  //                 // keyboardType:
  //                 // const TextInputType.numberWithOptions(decimal: true),
  //                 controller: _passwordController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Password',
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text('Create'),
  //                 onPressed: () async {
  //                   final String username = _usernameController.text;
  //                   final String password = _passwordController.text;
  //                   if (password != null) {
  //                     await _users.add({"username": username, "password": password});
  //
  //                     _usernameController.text = '';
  //                     _passwordController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //
  //       });
  // }
  //
  //
  //
  // Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //
  //     _usernameController.text = documentSnapshot['username'];
  //     _passwordController.text = documentSnapshot['password'];
  //   }
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _usernameController,
  //                 decoration: const InputDecoration(labelText: 'Username'),
  //               ),
  //               TextField(
  //                 // keyboardType:
  //                 // const TextInputType.numberWithOptions(decimal: true),
  //                 controller: _passwordController,
  //                 decoration: const InputDecoration(labelText: 'Password'),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text( 'Update'),
  //                 onPressed: () async {
  //                   final String name = _usernameController.text;
  //                   final String password = _passwordController.text;
  //                   if (password != null) {
  //                     await _users
  //                         .doc(documentSnapshot!.id)
  //                         .update({"username": name, "password": password});
  //                     _usernameController.text = '';
  //                     _passwordController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }
  //
  //
  // final CollectionReference _users =
  // FirebaseFirestore.instance.collection('users');
  //
  // Future<void> _delete(String productId) async {
  //   await _users.doc(productId).delete();
  //
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('You have successfully deleted a product')));
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () => _create(),
  //       child: const Icon(Icons.add),
  //
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  //
  //     body: StreamBuilder(
  //         stream: _users.snapshots(),
  //         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
  //           if(streamSnapshot.hasData){
  //             return ListView.builder(
  //                 itemCount: streamSnapshot.data!.docs.length,
  //                 itemBuilder: (context,index){
  //                   final DocumentSnapshot documentSnapshot =
  //                   streamSnapshot.data!.docs[index];
  //                   return Card(
  //                     margin: const EdgeInsets.all(10),
  //                     child: ListTile(
  //                       title: Text(documentSnapshot['username']),
  //                       subtitle: Text(documentSnapshot['password']),
  //                       trailing: SizedBox(
  //                         width: 100,
  //                         child: Row(
  //                           children: [
  //                             IconButton(
  //                                 icon: const Icon(Icons.edit),
  //                                 onPressed: () =>
  //                                     _update(documentSnapshot)),
  //                             IconButton(
  //                                 icon: const Icon(Icons.delete),
  //                                 onPressed: () =>
  //                                     _delete(documentSnapshot.id)),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 }
  //             );
  //           }
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //     ),
  //   );
  //
  //
  // }
}

// class TATSDKEnvironment {
//   static void setEnvironment(String apiKey, _TestPageState _testPageState) {}
// }

