import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../controllers/user_model.dart';
import '../profile_screen.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  late String userImageUrl;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  PickedFile? _imageFile;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();

  //final _controller = TextEditingController();
  final _controller = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  final formKey = GlobalKey<FormState>();

  String imageUrl ='';
  @override
  Widget build(BuildContext context) {
    // return Form(
    // key: formKey,
    // child: Container(
    return Container(
      width: 378,
      height: 410,
      decoration: const BoxDecoration(
        color: Styles.buttonColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: 378,
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        imageProfile(),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${loggedInUser.username}",
                                  style: GoogleFonts.bebasNeue(fontSize: 35)),
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/pencil.png",
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () async {
                                  // mark the function as async
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SimpleDialog(
                                            title: const Text("Edit Username"),
                                            children: <Widget>[
                                              SimpleDialogOption(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 24),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                        "${loggedInUser.username}"),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              32),
                                                      child: TextFormField(
                                                        controller: _usernameController,
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              30)),
                                                                ),
                                                                focusedBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.transparent),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              30)),
                                                                ),
                                                                prefixIcon:
                                                                    Image.asset(
                                                                  "assets/icons/pencil.png",
                                                                  width: 10,
                                                                  height: 10,
                                                                ),
                                                                hintText:
                                                                    "Username",
                                                                filled: true,
                                                                fillColor: Styles
                                                                    .bgBackground),

                                                            validator: (value) => value != null && value.length < 1
                                                            ? 'Please enter Username'
                                                            : null,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: TextButton(
                                                        style: ButtonStyle(
                                                            foregroundColor:
                                                                MaterialStateProperty.all(
                                                                    Colors
                                                                        .white),
                                                            backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    Styles
                                                                        .buttonColor),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    side: const BorderSide(color: Styles.buttonColor)))),
                                                        child: const Text("Change"),
                                                        onPressed: () async {
                                                          final isValid = formKey.currentState!.validate();
                                                          if (!isValid) return;
                                                          {
                                                            final String username = _usernameController.text.trim();
                                                            if (username != null) {
                                                              await _users.doc(user!.uid)
                                                              //.doc(documentSnapshot!.id)
                                                                  .update({"username": username});
                                                              //_usernameController.text = 'name';

                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const ProfileScreen(),
                                                                  ));
                                                           }
                                                            const AlertDialog(
                                                              title: Text('Incorrect'),
                                                            );
                                                            print("ERROR username");
                                                          }

                                                          // setState(() {
                                                          //   username =
                                                          //       _controller.text;
                                                          // });
                                                          // Navigator.of(context).pop();
                                                          //Get.back();
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ));
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${loggedInUser.describe}",
                                style: GoogleFonts.poppins(fontSize: 20)),
                            IconButton(
                              icon: Image.asset(
                                "assets/icons/pencil.png",
                                width: 20,
                                height: 20,
                              ),
                              onPressed: () async {
                                // mark the function as async
                                await showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        SimpleDialog(
                                          title: const Text("Edit describe"),
                                          children: <Widget>[
                                            SimpleDialogOption(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 24),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                      "${loggedInUser.describe}"),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            32),
                                                    child: TextFormField(
                                                      controller:
                                                          _describeController,
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            30)),
                                                              ),
                                                              focusedBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            30)),
                                                              ),
                                                              prefixIcon:
                                                                  Image.asset(
                                                                "assets/icons/pencil.png",
                                                                width: 10,
                                                                height: 10,
                                                              ),
                                                              hintText:
                                                                  "Describe",
                                                              filled: true,
                                                              fillColor: Styles
                                                                  .bgBackground),
                                                      validator: (value) => value !=
                                                                  null &&
                                                              value.length < 1
                                                          ? 'Please enter Describe'
                                                          : null,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          foregroundColor:
                                                              MaterialStateProperty.all(
                                                                  Colors.white),
                                                          backgroundColor:
                                                              MaterialStateProperty.all(
                                                                  Styles
                                                                      .buttonColor),
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          20),
                                                                  side: const BorderSide(
                                                                      color: Styles
                                                                          .buttonColor)))),
                                                      child: const Text("Change"),
                                                      onPressed: () async {
                                                        final isValid = formKey.currentState!.validate();
                                                        if (!isValid) return;
                                                        {
                                                          final String describe = _describeController.text.trim();
                                                          if (describe != null) {
                                                            await _users.doc(user!.uid)
                                                                //.doc(documentSnapshot!.id)
                                                                .update({
                                                              "describe": describe
                                                            });
                                                           // _describeController.text = '';
                                                            //Navigator.of(context).pop();
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const ProfileScreen(),
                                                                ));
                                                            //Get.back();
                                                          }
                                                          print("ERROR describe");
                                                        }

                                                        // setState(() {
                                                        //   describe =
                                                        //       _controller.text;
                                                        // });
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ));
                              },
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("123",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white))),
                        Text("create",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Text("123",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white))),
                          Text("join",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 20, color: Colors.white))),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("123",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white))),
                        Text("like",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        '${loggedInUser.image}' == "-"
        //_imageFile == null
            ? CircleAvatar(
                radius: 80,
                backgroundImage: const AssetImage("assets/images/user.png"),
                //backgroundImage: NetworkImage('${loggedInUser.image}'),

                backgroundColor: Colors.grey[400],
              )
            : CircleAvatar(
                radius: 80,
                //backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/gogotripdb.appspot.com/o/userimages%2F1677272716744?alt=media&token=471ff32a-5f9e-4ac8-9b6a-137f98219b42'),
                backgroundImage: NetworkImage('${loggedInUser.image}'),
                //backgroundImage: FileImage(File(_imageFile!.path)),
                backgroundColor: Colors.grey[400],
              ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                print('${file?.path}');
                print("camera");
                String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('userimages');

                Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                await referenceImageToUpload.putFile(File(file!.path));
                imageUrl = await referenceImageToUpload.getDownloadURL();
                await _users.doc(user!.uid).update({"image": imageUrl});

                // takePhoto(ImageSource.camera);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                      const ProfileScreen(),
                    ));

              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () async {

                ImagePicker imagePicker = ImagePicker();
                XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                print('${file?.path}');
                print("Gallery");

                String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('userimages');

                Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                await referenceImageToUpload.putFile(File(file!.path));
                imageUrl = await referenceImageToUpload.getDownloadURL();
                await _users.doc(user!.uid).update({"image": imageUrl});
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                      const ProfileScreen(),
                    ));
                // takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile!;
  //   });
  // }
}
