import 'package:cricket_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  late BuildContext context;
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 1),(){
      Get.offAllNamed(Routes.OVER_SELECTION);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
