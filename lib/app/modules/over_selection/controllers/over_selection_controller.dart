import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverSelectionController extends GetxController {
  //TODO: Implement OverSelectionController
  late BuildContext context;
  final count = 0.obs;
  List<String> overs=<String>['1 Over','2 Overs','3 Overs','4 Overs','5 Overs','6 Overs','7 Overs','8 Overs','9 Overs','10 Overs'];
  String selectedOver='6 Overs';
  @override
  void onInit() {
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
