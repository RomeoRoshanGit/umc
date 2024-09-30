import 'package:cricket_app/app/utils/color_res.dart';
import 'package:cricket_app/app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.context=context;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/umc.jpg',fit: BoxFit.cover,),
            ),
            Text("The Ultimate Cricket App..",style: textRegular(color: ColorRes.secondary,size: 18),)
          ],
        ),
      )
    );
  }
}
