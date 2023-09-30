// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reservationScreen/controller/reservation_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class SecondReservationScreen extends StatefulWidget {
  final String doctorId;
  const SecondReservationScreen({Key? key, required this.doctorId}) : super(key: key);

  @override
  State<SecondReservationScreen> createState() => _SecondReservationScreenState();
}

class _SecondReservationScreenState extends State<SecondReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: GetBuilder<ReservationController>(
        init: ReservationController(widget.doctorId),
        builder: (controller) => Container(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),

            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height*0.07,
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
                              child: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 30,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 30,)),                          const SizedBox(width: 5,),
                          CustomText(
                            secondReservationTitle.tr,
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
                              "2/2",
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
                              "2/2",
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
               Stack(
                 children: [
                   Container(
                     width: Get.width,
                     height: Get.height*0.23,
                   ),

                   Positioned(
                     bottom: 10,
                     left: 20,
                     child: Container(
                       width: Get.width*0.9,
                       height: Get.height*0.13,

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
                       child: Container(
                         width: Get.width*0.7,
                         child: Padding(
                           padding:  EdgeInsets.fromLTRB(0, Get.height*0.028, 0, 0),
                           child:  CustomText(
                             Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorData?.name??"":controller.doctorData?.nameEn??"",
                             textAlign: TextAlign.center,
                             style: const TextStyle(
                                 fontFamily: fontFamilyName,
                                 color: kBlueColor,
                                 fontWeight: FontWeight.w800,
                                 fontSize: 20),
                           ),
                         ),
                       ),
                     ),
                   ),
                   Positioned(
                     left: Get.width*0.4,
                     child: CachedNetworkImage(
                       fit: BoxFit.cover,
                       imageUrl: "https://privilegecare.net${controller.doctorData?.image??""}",
                       imageBuilder: ((context, image){
                         return  Container(
                           height: Get.height*0.12,
                           width: Get.width*0.2,
                           padding: const EdgeInsets.all(1),
                           decoration: BoxDecoration(
                             border: Border.all(color: kBlueColor,width: 2),
                             borderRadius: BorderRadius.circular(15),
                           ),
                           child: Container(
                             height: Get.height*0.12,
                             width: Get.width*0.2,
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
                                   fit: BoxFit.cover,
                                 ),

                                 borderRadius: BorderRadius.circular(15),
                               ),

                             ),
                           ),
                         );

                       }),
                       placeholder: (context, image){
                         return  Container(
                           height: Get.height*0.12,
                           width: Get.width*0.2,
                           padding: const EdgeInsets.all(1),
                           decoration: BoxDecoration(
                             border: Border.all(color: kBlueColor,width: 2),
                             borderRadius: BorderRadius.circular(15),
                           ),
                           child: Container(
                             height: Get.height*0.12,
                             width: Get.width*0.2,
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
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child:const Center(child: CircularProgressIndicator(color: kBlueColor,))
                             ),
                           ),
                         );
                       },
                       errorWidget: (context, url, error){
                         return Container(
                           height: Get.height*0.12,
                           width: Get.width*0.2,
                           padding: const EdgeInsets.all(1),
                           decoration: BoxDecoration(
                             border: Border.all(color: kBlueColor,width: 2),
                             borderRadius: BorderRadius.circular(15),
                           ),
                           child: Container(
                             height: Get.height*0.12,
                             width: Get.width*0.2,
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

                                 borderRadius: BorderRadius.circular(15),
                               ),
                               child: const Center(
                                 child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,),
                               ),
                             ),
                           ),
                         );
                       },
                     ),
                   ),
                 ],
               ),
                const SizedBox(height: 10,),
                Container(
                  width: Get.width*0.9,
                  height: Get.height*0.4,

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
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/updateProfileIcon.png",fit: BoxFit.fitHeight,),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              controller.makeReservationForAnotherPatient();
                            },
                            child: Container(
                              width: Get.width*0.7,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: kBlueColor,
                                    width: 2
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: kBlueColor,width: 1),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.check,size: 20,color: controller.reservationFroAnotherPatient == 1?kBlueColor:Colors.white,),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Container(
                                        width: Get.width*0.55,
                                        child:  CustomText(
                                          reservationForAnotherOne.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15
                                          ),),
                                      ),
                                    ],
                                  ),
                                  controller.reservationFroAnotherPatient == 0?const SizedBox() :TextFormField(
                                    controller: controller.nameController,
                                    decoration:   InputDecoration(
                                        labelText: reservationForAnotherOneName.tr,
                                        labelStyle: const TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15
                                        ),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey,width: 2),
                                          //  when the TextFormField in unfocused
                                        ) ,
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: kBlueColor,width: 2),
                                          //  when the TextFormField in focused
                                        ) ,
                                        border: const UnderlineInputBorder(
                                        )
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                  ),
                                  controller.reservationFroAnotherPatient == 0?const SizedBox(): Row(
                                    children: [
                                      Container(
                                        width: Get.width*0.4,
                                        child: TextFormField(
                                          controller: controller.phoneController,
                                          decoration:   InputDecoration(
                                              labelText:reservationForAnotherOnePhone.tr,

                                              labelStyle: const TextStyle(
                                                  fontFamily: fontFamilyName,
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15
                                              ),
                                              enabledBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey,width: 2),
                                                //  when the TextFormField in unfocused
                                              ) ,
                                              focusedBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(color: kBlueColor,width: 2),
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
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/updateProfileIcon.png",fit: BoxFit.fitHeight,),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: Get.width*0.7,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: kBlueColor,
                                  width: 2
                                ),
                              ),
                            ),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  controller.timeText,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                                CustomText(
                                  controller.dateText,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                                const SizedBox(height: 10,),
                                const Divider(
                                  color: kGreenColor,
                                  height: 1,
                                  thickness: 2,
                                  endIndent: 0,
                                  indent: 0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: 40,
                            width: 50,
                            child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: Get.width*0.7,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: kBlueColor,
                                  width: 2
                                ),
                              ),
                            ),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CustomText(
                                  controller.address??"لا يوجد عنوان حاليا",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                                const SizedBox(height: 10,),
                                const Divider(
                                  color: kGreenColor,
                                  height: 1,
                                  thickness: 2,
                                  endIndent: 0,
                                  indent: 0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: Get.width*0.9,
                  height: Get.height*0.1,

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        SizedBox(
                          height: 40,
                          width: 50,
                          child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          width: Get.width*0.7,
                          height: Get.height*0.08,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                  color: kBlueColor,
                                  width: 2
                              ),
                            ),
                          ),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                reservationPrice.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),

                              CustomText(
                                "${controller.doctorData?.amount??0} ${currencyKey.tr}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    if(!controller.reservationIsRunning) {
                     controller.addReservation(context);
                    }else{
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.loading,
                      );
                    }

                  },
                  child: Container(
                    width: Get.width*0.6,
                    height: Get.height*0.07,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Center(
                      child:  CustomText(
                        secondReservationBTN.tr,
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
      ),
    ));
  }
}
