import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/history_data_model.dart';
import 'package:privilegecare/Ui/reservationScreen/reservation_screen.dart';
import 'package:privilegecare/Ui/reviewiingMessage/reviewing_message_widget.dart';
import 'package:privilegecare/Ui/userHistory/controller/user_history_controller.dart';
import 'package:privilegecare/Ui/userHistory/widget/doctor_report_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../../Utils/translation_key.dart';

class HistoryCell extends StatelessWidget {
 final  HistoryDataModel? historyData;
 final  int index;
  const HistoryCell({super.key, required this.historyData, required this.index});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<UserHistoryController>(
      init: UserHistoryController(),
      builder: (controller) => Container(
        width: Get.width*0.9,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 6,
              color: Colors.black12,
            ),
          ],
          color: Colors.white,
          border: Border.all(
              color: kBlueColor,
              width: 2.0,
              style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(10),

        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomText(
                        controller.detectStatus(historyData?.status??"") == 0?visitHasBeenCanceled.tr:visitHasBeenFinished.tr,
                        style:  TextStyle(
                            fontFamily:fontFamilyName,
                            color: controller.detectStatus(historyData?.status??"") == 0?Colors.red:kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)
                    ),
                    const SizedBox(width: 5,),
                    CustomText(
                        controller.homeVisitOrNot== 0?clinicAnalysis.tr:homeAnalysis.tr,
                        style: const TextStyle(
                            fontFamily:fontFamilyName,
                            color:kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)
                    ),
                    const SizedBox(width: 5,),
                    CustomText(
                        controller.returnDateAndTime("${historyData?.date??""}"),
                        style: const TextStyle(
                            fontFamily:fontFamilyName,
                            color:kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)
                    ),
                    const SizedBox(width: 5,),
                    CustomText(
                        controller.historyData?[0].time??"",
                        style: const TextStyle(
                            fontFamily:fontFamilyName,
                            color:kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "${Services.baseUrl}${historyData?.image??""}",
                      imageBuilder: ((context, image){
                        return   Container(
                          height: Get.height*0.1,
                          width: Get.width*0.2,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlueColor,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: Get.height*0.12,
                            width: Get.width*0.3,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(color: kGreenColor,width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: Get.height*0.12,
                              width: Get.width*0.2,
                              decoration: BoxDecoration(
                                color: kBlueColor,
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),

                            ),
                          ),
                        );
                      }),
                      placeholder: (context, image){
                        return    Container(
                          height: Get.height*0.11,
                          width: Get.width*0.2,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlueColor,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: Get.height*0.12,
                            width: Get.width*0.3,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(color: kGreenColor,width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: Get.height*0.12,
                              width: Get.width*0.3,
                              decoration: BoxDecoration(
                                color: kBlueColor,

                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(color: kGreenColor,),
                              ),
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error){
                        return Container(
                            height: 80,
                            width: 80,

                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/doctor.png"),
                                fit: BoxFit.fill,
                              ),


                            )
                        );
                      },
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( historyData?.doctor??"",

                          style: const TextStyle(
                              height: 1,
                              fontFamily:fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                        const SizedBox(height: 5,),
                        Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?historyData?.spacEn??"":historyData?.spac??"",
                          style: const TextStyle(
                              height: 1,
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                        const SizedBox(height: 5,),
                        historyData?.point == 0? CustomText(noPointEarned.tr,
                          style: const TextStyle(
                              height: 1,
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),):
                        CustomText("${pointEarnedText1.tr} ${ historyData?.point} ${pointEarnedText1.tr}",
                          style: const TextStyle(
                              height: 1,
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(
                    onTap:(){
                      Get.to(()=>ReservationScreen(doctorId: "${historyData?.doctorId??0}"));
                    },
                    child: Container(
                      height: 40,

                      decoration: BoxDecoration(
                        color: Colors.white,

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
                          children:  [ const Icon(Icons.refresh,color: kBlueColor,),
                            CustomText(
                                reReservationBTN.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color:kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)
                            ),

                          ],

                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(context: context,
                        builder: (context) =>
                        const DoctorReport(),
                      );
                    },
                    child: Container(
                      height: 40,

                      decoration: BoxDecoration(
                        color: Colors.white,

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
                          children:  [ const Icon(Icons.receipt,color: kBlueColor,),
                            CustomText(
                                showDoctorReportBTN.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color:kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)
                            ),

                          ],

                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if(historyData?.review!=0){
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.warning,
                            title: reviewWarning.tr,

                        );
                      }else {
                        showDialog(context: context,
                          builder: (context) =>
                           ReviewingMessageWidget(historyId: historyData?.id??0,),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: Get.width*0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,

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
                          children:  [ const Icon(Icons.star,color: kBlueColor,),
                            CustomText(
                                reviewVisitBTN.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color:kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)
                            ),

                          ],

                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
