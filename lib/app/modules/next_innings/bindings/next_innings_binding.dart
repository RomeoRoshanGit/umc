import 'package:get/get.dart';

import '../controllers/next_innings_controller.dart';

class NextInningsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NextInningsController>(
      () => NextInningsController(),
    );
  }
}
