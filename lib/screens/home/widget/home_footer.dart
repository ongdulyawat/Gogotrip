import 'package:flutter/material.dart';
import 'package:gogotrip/widget/footer_bar.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  @override
  Widget build(BuildContext context) {
    return const FooterBar();
  }
}
