import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/detail_place/detail_screen.dart';
import 'package:gogotrip/screens/party_room/create_party_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyHeader extends StatefulWidget {
  const PartyHeader({Key? key}) : super(key: key);

  @override
  State<PartyHeader> createState() => _PartyHeaderState();
}

class _PartyHeaderState extends State<PartyHeader> {
  DateTime start_date = DateTime.now();
  DateTime end_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 245),
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 34, left: 10, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailScreen(data: null,),
                            ));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: const EdgeInsets.only(top: 50, right: 18),
                child: GestureDetector(
                  onTap: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreatePartyScreen(),
                          ));
                    }
                  },
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                        color: Styles.buttonCreateColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.exposure_plus_1,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(width: 3),
                        Text(
                          "create",
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
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 50,
                child: GestureDetector(
                  onTap: () async {
                    DateTime? newdate1 = await showDatePicker(
                        context: context,
                        initialDate: start_date,
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year + 10));
                    if (newdate1 == null) return;
                    setState(() => start_date = newdate1);
                  },
                  child: Container(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: Styles.boxShadows),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${start_date.day}/${start_date.month}/${start_date.year}",
                            style: GoogleFonts.bebasNeue(fontSize: 30)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 50,
                child: GestureDetector(
                  onTap: () async {
                    DateTime? newdate2 = await showDatePicker(
                        context: context,
                        initialDate: end_date,
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year + 10));
                    if (newdate2 == null) return;
                    setState(() => end_date = newdate2);
                  },
                  child: Container(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: Styles.boxShadows),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${end_date.day}/${end_date.month}/${end_date.year}",
                            style: GoogleFonts.bebasNeue(fontSize: 30)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

// Future pickDate(BuildContext context) async {
//   final initialDate = DateTime.now();
//   final newDate = await showDatePicker(
//     context: context,
//     initialDate: initialDate,
//     firstDate: DateTime(DateTime.now().year - 10),
//     lastDate: DateTime(DateTime.now().year + 10),
//   );
//   if (date == null) {
//     return "Select Date";
//   } else {
//     return "${date.day}/${date.month}/${date.year}";
//   }
// }
}
