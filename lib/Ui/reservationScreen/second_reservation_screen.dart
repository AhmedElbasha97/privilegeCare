// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reservationScreen/controller/reservation_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';

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
                              child: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 30,)),
                          const SizedBox(width: 5,),
                          const Text(
                            "تأكيد الحجز",
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),

                        ],
                      ),
                    ),
                    Positioned(
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
                            child:  Text(
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
                           child:  Text(
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
                     child: Container(
                       height: Get.height*0.11,
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
                                        child: const Text(
                                          "أنا أقوم بالحجز نيابه عن مريض أخر",
                                          style: TextStyle(
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
                                    decoration:  const InputDecoration(
                                        labelText: "الإسم كامل",
                                        labelStyle: TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey,width: 2),
                                          //  when the TextFormField in unfocused
                                        ) ,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: kBlueColor,width: 2),
                                          //  when the TextFormField in focused
                                        ) ,
                                        border: UnderlineInputBorder(
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
                                          decoration:  const InputDecoration(
                                              labelText: "رقم المحمول",

                                              labelStyle: TextStyle(
                                                  fontFamily: fontFamilyName,
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey,width: 2),
                                                //  when the TextFormField in unfocused
                                              ) ,
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: kBlueColor,width: 2),
                                                //  when the TextFormField in focused
                                              ) ,
                                              border: UnderlineInputBorder(
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
                                Text(
                                  controller.timeText,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                                Text(
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
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "برج الكرامة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                                SizedBox(height: 10,),
                                Divider(
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
                              const Text(
                                "سعر الكشف",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),

                              Text(
                                "${controller.doctorData?.amount??0} ريال",
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
                    controller.addReservation(context);
                  },
                  child: Container(
                    width: Get.width*0.5,
                    height: Get.height*0.07,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child:  Text(
                        "تأكيد الحجز",
                        style: TextStyle(
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
