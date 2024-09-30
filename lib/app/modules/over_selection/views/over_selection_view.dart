import 'package:cricket_app/app/routes/app_pages.dart';
import 'package:cricket_app/app/utils/color_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cricket_app/app/utils/styles.dart';
import '../controllers/over_selection_controller.dart';

class OverSelectionView extends GetView<OverSelectionController> {
  const OverSelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_baseball_rounded,
              size: 150,
              color: ColorRes.ballColor,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Select Overs',
              style: textSemiBold(color: ColorRes.textColor, size: 38),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                width: Get.width / 1.3,
                child: Text(
                  "Please select your overs to help us for give you a better expeirence",
                  textAlign: TextAlign.center,
                  style: textRegular(color: ColorRes.secondary),
                )),
            const SizedBox(
              height: 40,
            ),
            DropdownMenu(
              width: Get.width/1.3,
              initialSelection: controller.overs[5],
              onSelected: (String? value) {
                controller.selectedOver=value??"6 Overs";
              },
              dropdownMenuEntries: controller.overs
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: ColorRes.secondary, width: 0),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        color: ColorRes.secondary,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: ColorRes.secondary),
                      borderRadius: BorderRadius.circular(10))
              ),
              menuHeight: 200,
              menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(ColorRes.bgColor),
                shadowColor: MaterialStateProperty.all(ColorRes.secondary),
                elevation: MaterialStateProperty.all(5),
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.MAIN_PAGE,arguments: controller.selectedOver);
              },
              child: Container(
                width: Get.width/1.3,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorRes.ballColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Text("Go Ahead",style: textMedium(size: 14,color: ColorRes.bgColor),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
