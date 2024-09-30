import 'package:cricket_app/app/utils/color_res.dart';
import 'package:cricket_app/app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.context=context;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      appBar: AppBar(
        title: Text('Scorecard',style: textSemiBold(size: 30,color: ColorRes.ballColor),),
        backgroundColor: ColorRes.bgColor,
      ),
      body: Obx(()=>
        controller.ballsReady.value==false?
            CupertinoActivityIndicator():
        SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Total: ${controller.totalRuns}",style: textSemiBold(size: 18),),
                      ],
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.Overnum,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Over ${index+1}",style: textSemiBold(size: 16),),
                                  Obx(()=>Text("Over total: ${controller.balls[index]['total'].value.toString()} runs",style: textRegular(),))
                                ],
                              ),
                              const SizedBox(height: 12,),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(1, 1),
                                          blurStyle: BlurStyle.outer,
                                          color: ColorRes.shadowColor
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10)
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height:50,
                                        child: Obx(()=>ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:controller.balls[index]['Over ${index+1}'].length,
                                            itemBuilder: (context,index2){
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                child: CircleAvatar(
                                                  backgroundColor: ColorRes.textColor,
                                                  radius: 15,
                                                  child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: ColorRes.bgColor,
                                                      child: Obx(()=>Text("${controller.balls[index]["Over ${index+1}"][index2]["runs"].value}",style: textRegular(),),)
                                                  ),
                                                ),
                                              );
                                            }
                                        ),),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                    )
                  ],
                ),
              )
          ),
        ),
      ),
      floatingActionButton: Obx(()=>
        controller.inningsOver.value==true?
        FloatingActionButton(onPressed: (){},
          child: Icon(Icons.next_plan,color: ColorRes.bgColor,),
          backgroundColor: ColorRes.ballColor,
        ):SizedBox()
      ),
      bottomNavigationBar: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(1, 1),
              blurStyle: BlurStyle.outer,
              color: ColorRes.shadowColor
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.setRuns(1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.secondary,
                      child: Text("1",style: textMedium(color: ColorRes.bgColor),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.secondary,
                      child: Text("2",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(3);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.secondary,
                      child: Text("3",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(4);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.fourColor,
                      child: Text("4",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.setRuns(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.secondary,
                      child: Text("5",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(6);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.ballColor,
                      child: Text("6",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(7);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.wicketColor,
                      child: Text("W",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(8);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.extraColor,
                      child: Text("E",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.setRuns(0);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ColorRes.secondary,
                      child: Text(".",style: textMedium(color: ColorRes.bgColor)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
