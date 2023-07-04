import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/userHistory/controller/user_history_controller.dart';
import 'package:privilegecare/Ui/userHistory/widget/history_cell.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

import '../../Utils/translation_key.dart';
import '../../widgets/custom_text_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHistoryController>(
      init: UserHistoryController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: false,
          title:   CustomText(
            historyTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        backgroundColor: kLightGrayColor,
        body:controller.isLoading?const Loader():
        GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              controller.changeTap(1);
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              controller.changeTap(0);
            }
          },
          child:
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                        onTap: (){
                          controller.changeTap(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 50,
                            width: Get.width*0.43,
                            decoration: BoxDecoration(
                              color:controller.homeVisitOrNot == 0? kBlueColor:Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                  color: Colors.black12,
                                ),
                              ],
                              border: Border.all(
                                  color: kBlueColor,
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [CustomText(
                                    historyTag1.tr,
                                    style: TextStyle(
                                        fontFamily:fontFamilyName,
                                        color:controller.homeVisitOrNot == 0? Colors.white:kBlueColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)
                                ),

                                ],

                              ),
                            ),
                          ),
                        ),
                      ),
                        InkWell(
                          onTap: (){
                            controller.changeTap(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 50,
                              width: Get.width*0.43,
                              decoration: BoxDecoration(
                                color: controller.homeVisitOrNot == 1?kBlueColor:Colors.white,

                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 6,
                                    color: Colors.black12,
                                  ),
                                ],
                                border: Border.all(
                                    color: kBlueColor,
                                    width: 2.0,
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [CustomText(
                                      historyTag2.tr,
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color:controller.homeVisitOrNot == 1? Colors.white:kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)
                                  ),

                                  ],

                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  controller.hasNoData?
                  NoDataWidget(text: controller.homeVisitOrNot == 1? noHistoryDataHome.tr: noHistoryDataHosp.tr,imgPath: "assets/images/Insurance-pana.png", refreshedFunc: (){},hasRefreshButtonOrNot: false,height: Get.height*0.7,)
                      :Container(
                    width: Get.width,
                    height: Get.height*0.75,
                    color: kLightGrayColor,
                    child: RawScrollbar(
                      thumbColor: kBlueColor,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView.builder(
                        itemCount: controller.historyData?.length,
                        controller: controller.sController,
                        itemBuilder: (_,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HistoryCell(historyData: controller.historyData?[index],index: index,),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
