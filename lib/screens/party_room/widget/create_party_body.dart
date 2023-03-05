import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreatePartyBody extends StatefulWidget {
  const CreatePartyBody({Key? key}) : super(key: key);

  @override
  State<CreatePartyBody> createState() => _CreatePartyBodyState();
}

class _CreatePartyBodyState extends State<CreatePartyBody> {
  TextEditingController? controller;
  late DateTime _selectDate = DateTime.now();
  String _endTime = "9.30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  bool clickBoy = false;
  bool clickGirl = false;
  bool clickAny = false;
  var maxLength = 35;
  var textLength = 0;
  int _selectMember = 1;
  List<int> memberNum = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  clickButtonBoy() {
    setState(() {
      clickBoy = !clickBoy;
    });
  }

  clickButtonGirl() {
    setState(() {
      clickGirl = !clickGirl;
    });
  }

  clickButtonAny() {
    setState(() {
      clickAny = !clickAny;
    });
  }

  _getDate() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2030));
    if (_pickDate != null) {
      setState(() {
        _selectDate = _pickDate;
      });
    }
  }

  _getTime({required bool isStartTime}) async {
    var pickTime = await _showTimePicker();
    String _formateTime = pickTime.format(context);
    if (pickTime == null) {
      print('time error');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formateTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formateTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 58,
                child: Text("Kasetsart",
                    style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(fontSize: 40))),
              ),
              Expanded(
                  flex: 42,
                  child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                              color: Styles.buttonColor,
                              border: Border.all(
                                  width: 2.0, color: Styles.buttonColor),
                              borderRadius: BorderRadius.circular(12)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.exposure_plus_1,
                                  size: 17,
                                  color: Colors.white
                                ),
                                const SizedBox(width: 3),
                                Text('Create Party',
                                    style: GoogleFonts.poppins(
                                        textStyle:  TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Date",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(height: 5),
          Container(
            height: 52,
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2.0, color: Styles.buttonColor),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  enabled: false,
                  autofocus: false,
                  cursorColor: Styles.buttonColor,
                  // controller: controller,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Colors.transparent,
                          width: 0),
                    ),
                    // hintText: DateFormat.yMMMMd().format(_selectDate),
                    hintText:
                        "${_selectDate.day}/${_selectDate.month}/${_selectDate.year}",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600])),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                )),
                Container(
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDate();
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text("Start Time",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              Expanded(
                child: Text("End Time",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        cursorColor: Styles.buttonColor,
                        // controller: controller,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.transparent,
                                width: 0),
                          ),
                          // hintText: DateFormat.yMMMMd().format(_selectDate),
                          hintText: _startTime,
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                        ),
                      )),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTime(isStartTime: true);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        cursorColor: Styles.buttonColor,
                        // controller: controller,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.transparent,
                                width: 0),
                          ),
                          // hintText: DateFormat.yMMMMd().format(_selectDate),
                          hintText: _endTime,
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600])),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                        ),
                      )),
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _getTime(isStartTime: false);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 75,
                child: Text("Sex",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              Expanded(
                flex: 25,
                child: Text("Member",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                  flex: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 2.0, color: Styles.buttonColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                clickButtonBoy();
                                setState(() {
                                  clickGirl = false;
                                  clickAny = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickBoy == false
                                      ? Colors.white
                                      : Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: clickBoy == false
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                clickButtonGirl();
                                setState(() {
                                  clickBoy = false;
                                  clickAny = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickGirl == false
                                      ? Colors.white
                                      : Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("G",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: clickGirl == false
                                              ? Colors.black
                                              : Colors.white)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                clickButtonAny();
                                setState(() {
                                  clickBoy = false;
                                  clickGirl = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: clickAny == false
                                      ? Colors.white
                                      : Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: Styles.boxShadows,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Any",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: clickAny == false
                                              ? Colors.black
                                              : Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 25,
                child: Container(
                  height: 52,
                  width: 25,
                  margin: const EdgeInsets.only(right: 18),
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Styles.buttonColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          autofocus: false,
                          cursorColor: Styles.buttonColor,
                          // controller: controller,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.transparent,
                                  width: 0),
                            ),
                            // hintText: DateFormat.yMMMMd().format(_selectDate),
                            hintText: "$_selectMember",
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600])),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            disabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                        ),
                      ),
                      DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            width: 0,
                          ),
                          items: memberNum
                              .map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectMember = int.parse(newValue!);
                            });
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text("Note",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(height: 5),
          Container(
            height: 70,
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2.0, color: Styles.buttonColor),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      minLines: 1,
                  maxLines: 2,
                  maxLength: maxLength,
                  keyboardType: TextInputType.multiline,
                  enabled: true,
                  autofocus: false,
                  cursorColor: Styles.buttonColor,
                  onChanged: (value) {
                    setState(() {
                      textLength = value.length;
                    });
                  },
                  // controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    suffixText:
                        '${textLength.toString()}/${maxLength.toString()}',
                    counterText: "",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Colors.transparent,
                          width: 0),
                    ),
                    // hintText: DateFormat.yMMMMd().format(_selectDate),
                    hintText: "Add your note",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600])),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
