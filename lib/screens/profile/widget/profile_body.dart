import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final _controller = TextEditingController();
  String ig = "Ong vst";
  String facebook = "Ong dyw";
  String line = "-";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/instagram.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text(ig,
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change IG"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(ig),
                                      Container(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              prefixIcon: Image.asset(
                                                "assets/icons/pencil.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                              hintText: "IG",
                                              filled: true,
                                              fillColor: Styles.bgBackground
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () {
                                            setState(() {
                                              ig =
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
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/facebook.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text(facebook,
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change Facebook"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(facebook),
                                      Container(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              prefixIcon: Image.asset(
                                                "assets/icons/pencil.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                              hintText: "Facebook",
                                              filled: true,
                                              fillColor: Styles.bgBackground
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () {
                                            setState(() {
                                              facebook =
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
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/line.png",
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () async {},
                ),
                Text(line,
                    style: GoogleFonts.poppins(fontSize: 20)),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/pencil.png",
                    width: 20,
                    height: 18,
                  ),
                  onPressed: () async {
                    // mark the function as async
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            SimpleDialog(
                              title: const Text("Change Line"),
                              children: <Widget>[
                                SimpleDialogOption(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(line),
                                      Container(
                                        padding: const EdgeInsets.all(32),
                                        child: TextField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.transparent),
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              prefixIcon: Image.asset(
                                                "assets/icons/pencil.png",
                                                width: 10,
                                                height: 10,
                                              ),
                                              hintText: "Line",
                                              filled: true,
                                              fillColor: Styles.bgBackground
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              backgroundColor: MaterialStateProperty.all(Styles.buttonColor),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                      side: BorderSide(color: Styles.buttonColor)
                                                  )
                                              )
                                          ),
                                          child: Text("Change"),
                                          onPressed: () {
                                            setState(() {
                                              line =
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
            ),
          ],
        ),
      ),
    );
  }
}
