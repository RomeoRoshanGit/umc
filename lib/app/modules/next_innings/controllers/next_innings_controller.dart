import 'package:cricket_app/app/utils/color_res.dart';
import 'package:cricket_app/app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NextInningsController extends GetxController {
  //TODO: Implement NextInningsController

  late BuildContext context;
  RxBool ballsReady = false.obs;
  int overChange = 0;
  int ballChange = 0;
  String over = '';
  int Overnum = 0;
  final count = 0.obs;
  RxInt totalRuns = 0.obs;
  RxInt toWin=0.obs;
  var balls = [].obs;
  RxBool inningsOver = false.obs;

  @override
  void onInit() {
    List data = Get.arguments as List;
    over=data[1];
    toWin.value=data[0].value+1;
    setOver(over);
    super.onInit();
  }

  void setRuns(int run) {
    if (run == 7) {
      balls[overChange]['Over ${overChange + 1}'][ballChange]['runs'].value =
      "W";
    }
    else if (run == 8) {
      balls[overChange]['Over ${overChange + 1}'].add({
        "runs": "".obs
      });
      balls[overChange]['Over ${overChange + 1}'][ballChange]['runs'].value =
      "E";
      balls[overChange]['total'] += 1;
      totalRuns.value += 1;
      toWin.value-=1;
    }
    else {
      balls[overChange]['Over ${overChange + 1}'][ballChange]['runs'].value =
          run.toString();
      balls[overChange]['total'] += run;
      totalRuns.value += run;
      toWin.value-=run;
    }

    print(balls[0]['Over 1'][0]['runs']);
    ballChange++;
    print("$ballChange ${balls[overChange]["Over ${overChange + 1}"].length}");
    if (overChange + 1 == balls.length &&
        ballChange == balls[overChange]["Over ${overChange + 1}"].length) {
      inningsOver.value = true;
      print("INNINGS OVER");
      Get.defaultDialog(
        contentPadding: EdgeInsets.all(5),
        titlePadding: EdgeInsets.only(top: 30),

        backgroundColor: ColorRes.bgColor,
        confirm: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 30, top: 5),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Expanded(
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorRes.ballColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text(
                  "2nd Innings", style: textMedium(color: ColorRes.bgColor),)),
              ),
            ),
          ),
        ),
        cancel: Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 30, top: 5),
          child: Expanded(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorRes.bgColor,
                    border: Border.all(color: ColorRes.ballColor!),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text(
                  "Cancel", style: textMedium(color: ColorRes.ballColor),),),
              ),
            ),
          ),
        ),
        titleStyle: textSemiBold(size: 20),
        middleTextStyle: textRegular(size: 12, color: ColorRes.secondary),
        title: "Innings Over",
        middleText: "You have scored $totalRuns.",
        textConfirm: "Confirm",
        textCancel: "Cancel",
        onConfirm: () {
          Get.back(); // Close the dialog on confirm
          print("Confirmed");
        },
        onCancel: () {
          Get.back();
          print("Canceled");
        },
      );
    }
    if (ballChange == balls[overChange]["Over ${overChange + 1}"].length) {
      print("Entered");
      overChange++;
      ballChange = 0;
    }
  }

  void setBalls(int overNum) {
    for (int i = 0; i < overNum; i++) {
      var runs = [].obs;
      for (int j = 1; j <= 6; j++) {
        runs.add({
          "runs": "".obs
        });
      }
      balls.add({
        "Over ${i + 1}": runs,
        "total": 0.obs
      });
    }
    ballsReady.value = true;
  }

  void setOver(String over) {
    switch (over) {
      case "1 Over":
        Overnum = 1;
        break;
      case "2 Overs":
        Overnum = 2;
        break;
      case "3 Overs":
        Overnum = 3;
        break;
      case "4 Overs":
        Overnum = 4;
        break;
      case "5 Overs":
        Overnum = 5;
        break;
      case "6 Overs":
        Overnum = 6;
        break;
      case "7 Overs":
        Overnum = 7;
        break;
      case "8 Overs":
        Overnum = 8;
        break;
      case "9 Overs":
        Overnum = 9;
        break;
      case "10 Overs":
        Overnum = 10;
        break;
    }
    setBalls(Overnum);
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
