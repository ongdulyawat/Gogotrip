import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';
import 'package:gogotrip/screens/calendar/widget/calendar_header.dart';
import 'package:gogotrip/screens/calendar/widget/finish_history.dart';
import 'package:gogotrip/screens/calendar/widget/incoming_history.dart';
import 'package:gogotrip/screens/home/widget/home_footer.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgBackground1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalendarHeader(),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Styles.buttonColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TabBar(
                              unselectedLabelColor: Colors.white,
                              labelColor: Colors.black,
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              controller: tabController,
                              tabs: [
                                Tab(
                                  text: 'Coming',
                                ),
                                Tab(
                                  text: 'Finish',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          IncomingHistory(),
                          FinishHistory()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: HomeFooter()
    );
  }
}
