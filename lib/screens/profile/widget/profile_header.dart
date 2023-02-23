import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  PickedFile? _imageFile;
  final _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String feeling = "Love Salmon,love travel";
  String username = "Ong Dulyawat";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 400,
      decoration: const BoxDecoration(
        color: Styles.buttonColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 378,
              height: 325,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              child: Form(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
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
                            Text(username,
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
                                                  Text(username),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            32),
                                                    child: TextField(
                                                      controller: _controller,
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
                                                                  "Username",
                                                              filled: true,
                                                              fillColor: Styles
                                                                  .bgBackground),
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
                                                                  side: BorderSide(
                                                                      color: Styles
                                                                          .buttonColor)))),
                                                      child: Text("Change"),
                                                      onPressed: () {
                                                        setState(() {
                                                          username =
                                                              _controller.text;
                                                        });
                                                        // Navigator.of(context).pop();
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
                          Text(feeling,
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
                                        title: const Text("Edit Feeling"),
                                        children: <Widget>[
                                          SimpleDialogOption(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 24),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(feeling),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(32),
                                                  child: TextField(
                                                    controller: _controller,
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30)),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30)),
                                                        ),
                                                        prefixIcon: Image.asset(
                                                          "assets/icons/pencil.png",
                                                          width: 10,
                                                          height: 10,
                                                        ),
                                                        hintText:
                                                            "Change feeling",
                                                        filled: true,
                                                        fillColor: Styles
                                                            .bgBackground),
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
                                                        backgroundColor: MaterialStateProperty.all(
                                                            Styles.buttonColor),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        20),
                                                                side: const BorderSide(
                                                                    color:
                                                                        Styles.buttonColor)))),
                                                    child: const Text("Change"),
                                                    onPressed: () {
                                                      setState(() {
                                                        feeling =
                                                            _controller.text;
                                                      });
                                                      // Navigator.of(context).pop();
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                              Navigator.pop(context);
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
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile == null
            ? CircleAvatar(
                radius: 80,
                backgroundImage: const AssetImage("assets/images/user.png"),
                backgroundColor: Colors.grey[400],
              )
            : CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(File(_imageFile!.path)),
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
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
