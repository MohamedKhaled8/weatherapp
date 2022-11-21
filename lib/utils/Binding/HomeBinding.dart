
import 'package:get/get.dart';

import '../../../controller/HomeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'Cairo'));
  }
}
