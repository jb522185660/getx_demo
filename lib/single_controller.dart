import 'package:get/get.dart';

class SingleController extends GetxController {
  var count = 0.obs;

  increment() {
    count ++;
  }
}