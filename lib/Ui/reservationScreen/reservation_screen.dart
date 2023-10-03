// ignore_for_file: unnecessary_const, sized_box_for_whitespace, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reservationScreen/controller/reservation_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';

class ReservationScreen extends StatelessWidget {
  final String doctorId;
  const ReservationScreen({Key? key, required this.doctorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: GetBuilder<ReservationController>(
        init: ReservationController(doctorId),
        builder: (controller) => controller.isLoading?const Loader() :

          SingleChildScrollView(

            child: Column(
              children: [
                 Stack(
                   children: [
                     Container(
                       width: Get.width,
                       height: Get.height*0.1,
                     ),
                     Container(
                       width: Get.width,
                       height: Get.height*0.05,
                       color: kGreenColor,
                       child: Row(

                         children: [
                           const SizedBox(width: 5,),
                         InkWell(
                           onTap: (){
                             Get.back();
                           },
                             child: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 30,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 30,)),
                           const SizedBox(width: 5,),
                            CustomText(
                              firstReservationTitle.tr,
                             style: const TextStyle(
                                 fontFamily: fontFamilyName,
                                 color: kWhiteColor,
                                 fontWeight: FontWeight.w800,
                                 fontSize: 18),
                           ),

                         ],
                       ),
                     ),
                     Get.find<StorageService>().activeLocale == SupportedLocales.english?Positioned(
                         top: 15,
                         right: 13,
                         child: Container(
                           width: Get.width*0.1,
                           height: Get.height*0.05,

                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(25),
                             color: kBlueColor,
                           ),
                           child: const Center(
                             child:  CustomText(
                               "1/2",
                               style: TextStyle(
                                   fontFamily: fontFamilyName,
                                   color: kWhiteColor,
                                   fontWeight: FontWeight.w800,
                                   fontSize: 18),
                             ),
                           ),
                         )):Positioned(
                       top: 15,
                         left: 13,
                         child: Container(
                       width: Get.width*0.1,
                       height: Get.height*0.05,

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(25),
                         color: kBlueColor,
                       ),
                       child: const Center(
                         child:  CustomText(
                           "1/2",
                           style: TextStyle(
                               fontFamily: fontFamilyName,
                               color: kWhiteColor,
                               fontWeight: FontWeight.w800,
                               fontSize: 18),
                         ),
                       ),
                     ))
                   ],
                 ),
                Container(
                  width: Get.width*0.9,
                  height: Get.height*0.15,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kBlueColor,width: 1),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child:
                  controller.doctorData?.schedule?.length==0?Center(
                    child: Container(
                      height: 130,
                      width: Get.width*0.75,
                      child: Row(
                        children: [
                          Image.asset("assets/images/Time management-rafiki.png",height: Get.width*0.23,),
                          CustomText(reservationNoDateAvailable.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Container(
                        width: Get.width*0.6,
                        height: Get.height*0.06,
                        child:  Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  reservationDate.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                                const SizedBox(width: 10,),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) =>
                                      controller.doctorData!.schedule!.map((e){
                                        return   PopupMenuItem(
                                          value:"${e.id}",
                                          onTap: (){
                                            controller.choosingDate("${e.id??0}",e.date??"" );
                                          },
                                          child: Text(
                                            e.date??"",
                                            style: const TextStyle(
                                                color: kBlueColor,
                                                fontFamily: fontFamilyName,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        );
                                      }).toList(),

                                  child:  CustomText(
                                    controller.dateText,
                                    style: const TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                const Icon(Icons.calendar_month_outlined,color: kBlueColor,size: 30,)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Divider(
                              color: kGreenColor,
                              height: 1,
                              thickness: 2,
                              endIndent: 0,
                              indent: 0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                     controller.enableChooseTime?Container(
                        width: Get.width*0.6,
                        height: Get.height*0.05,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              reservationTime.tr,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            ),
                            const SizedBox(width: 10,),
                            PopupMenuButton<String>(
                              itemBuilder: (context) =>
                               controller.appointments!.map((e){
                               return   PopupMenuItem(
                                 value:e,
                                 onTap: (){
                                   controller.selectingTime(e, context);
                                 },
                                 child: CustomText(
                                   controller.changeTimeToAmPmFormat(e,context),
                                   style: const TextStyle(
                                       color: kBlueColor,
                                       fontFamily: fontFamilyName,
                                       fontWeight: FontWeight.w700),
                                 ),
                               );
                               }).toList(),

                              child: Container(
                                width: Get.width*0.4,
                                height: Get.height*0.05,
                                child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        controller.appointments?.length == 0?Container(
                                          width:Get.width*0.3,
                                          child: CustomText(
                                            controller.timeText,
                                            textAlign: TextAlign.center ,
                                            style: const TextStyle(
                                                fontFamily: fontFamilyName,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12),
                                          ),
                                        ): CustomText(
                                            controller.timeText,
                                            textAlign: TextAlign.center ,
                                            style: const TextStyle(
                                                fontFamily: fontFamilyName,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18),
                                          ),

                                        const Icon(Icons.arrow_downward,color: kBlueColor,size: 16,),
                                      ],
                                    ),

                                    const Divider(
                                      color: kGreenColor,
                                      height: 1,
                                      thickness: 2,
                                      endIndent: 0,
                                      indent: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ):const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: Get.width*0.9,
                  height: Get.height*0.59,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kBlueColor,width: 1),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                      extraDataTitle.tr,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),),
                      CustomText(
                         extraDataText.tr,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kGreenColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Container(
                                  width: Get.width*0.15,
                                  child: TextFormField(
                                    maxLength: 2,
                                    style:  const TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: fontFamilyName,
                                    fontWeight: FontWeight.w700,
                                    color: kGrayColor,
                                  ),
                                    decoration:   InputDecoration(
                                        labelText: extraDataAgeTitle.tr,
                                        counterText: '',

                                        labelStyle: const TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18
                                        ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: kGreenColor,width: 2),
                                          //  when the TextFormField in unfocused
                                        ) ,
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: kGreenColor,width: 2),
                                          //  when the TextFormField in focused
                                        ) ,
                                        border: const UnderlineInputBorder(
                                        )
                                    ),
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: Get.width*0.4,
                              height: Get.height*0.08,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    extraDataGenderTitle.tr,

                                    style: const TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18
                                    ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(

                                          onTap: (){
                                            controller.choosingGender(1);
                                          },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: kBlueColor,width: 1),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Icon(Icons.check,size: 20,color: controller.choosenGender == 1?kBlueColor:Colors.white,),
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            CustomText(
                                               extraDataGenderMale.tr,
                                              style: const TextStyle(
                                                  fontFamily: fontFamilyName,
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 17
                                              ),),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          controller.choosingGender(2);
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: kBlueColor,width: 1),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Icon(Icons.check,size: 20,color: controller.choosenGender == 2?kBlueColor:Colors.white,),
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            CustomText(
                                               extraDataGenderFemale.tr,
                                              style: const TextStyle(
                                                  fontFamily: fontFamilyName,
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 17
                                              ),),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),


                                  const Divider(
                                    color: kGreenColor,
                                    height: 1,
                                    thickness: 2,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        Container(
                          width: Get.width*0.9,
                          height: Get.height*0.13,
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                extraDataComment.tr,

                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),),
                              const SizedBox(height: 10),
                              Container(
                                width: Get.width*0.9,
                                height: Get.height*0.07,

                                child:  Center(
                                  child:  TextField(


                                    cursorColor: kBlueColor,
                                    textInputAction: TextInputAction.done,
                                    style:  const TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                    ),
                                    decoration:  InputDecoration(
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide: const BorderSide(width: 1, color: kBlueColor,),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:   const BorderSide(color: kBlueColor,width: 1.0),
                                            borderRadius: BorderRadius.circular(15)),

                                        hintText: extraDataCommentText.tr,
                                        hintStyle: const TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kGrayColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),


                                        suffixStyle: const TextStyle(color: kGreenColor)),
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        Container(
                          width: Get.width*0.9,
                          height: Get.height*0.13,
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                 extraDataFileTitle.tr,

                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: (){
                                  controller.pickFile();
                                },
                                child: Container(
                                  width: Get.width*0.9,
                                  height: Get.height*0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kBlueColor,width: 1)
                                  ),
                                  child:  Center(
                                    child: controller.choosenFileIndex == "1"? Text(
                                      controller.pickedFile?.files[0].name??"",
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15),
                                    ): Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          extraDataFileText.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.add,color: kBlueColor,size: 30,)

                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                   controller.gotoAnotherReservationScreen(context);
                  },
                  child: Container(
                    width: Get.width*0.5,
                    height: Get.height*0.07,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Center(
                      child:  CustomText(
                        nextPageBTN.tr,
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

      ),
    ));
  }
}
