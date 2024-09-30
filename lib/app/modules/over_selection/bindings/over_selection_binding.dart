import 'package:get/get.dart';

import '../controllers/over_selection_controller.dart';

class OverSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OverSelectionController>(
      () => OverSelectionController(),
    );
  }
}
