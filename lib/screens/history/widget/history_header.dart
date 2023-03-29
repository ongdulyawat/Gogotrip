import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryHeader extends StatefulWidget {
  const HistoryHeader({Key? key}) : super(key: key);

  @override
  State<HistoryHeader> createState() => _HistoryHeaderState();
}

class _HistoryHeaderState extends State<HistoryHeader> {
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
                  const EdgeInsets.only(top: 34, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      {
                        Get.back();
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
              child: Container()
            )
          ],
        ),
      ],
    );
  }
}
