import 'package:get/get.dart';

abstract class StatefulController extends GetxController {


  @override
  Future<void> onInit() async {
    initial();
    super.onInit();
  }

  void initial();
  void clear();

}
