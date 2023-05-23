// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/reservation_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class DoctorCellWidget extends StatelessWidget {
  final DoctorListModel? doctorData;
  const DoctorCellWidget({Key? key, required this.doctorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Get.to( DoctorDetailedScreen(doctorId: "${doctorData?.id??0}",));
        },
        child: SizedBox(

          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                           Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.nameEn??"":doctorData?.name??"",

                            style: const TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 19),),
                           const SizedBox(height: 5,),
                           Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.specialistEn??"":doctorData?.specialist??"",
                            style: const TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                              ),SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                              ),SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                              ),SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                              ),SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const Text("التقييم العام من 1000 زائر",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),),

                        ],
                      ),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      doctorData?.listen==0?SizedBox(): Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.35,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/new patient.png",fit: BoxFit.fitWidth,),
                            ),

                              const Text("مستمع جيد ",
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),

                            ],
                          ),
                        ),
                      ),
                      doctorData?.explain==0?SizedBox():Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.35,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/oldPatient.png",fit: BoxFit.fitWidth,),
                            ),
                              const Text("شرحه مفصل ",
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 20,
                        child: Image.asset("assets/images/specification.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.65,
                        child:  Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.levelEn??"":doctorData?.level??"",
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ),




                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 20,
                        child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.6,
                        child:  Text(doctorData?.hosp??"",
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                          textAlign: TextAlign.start,
                        ),

                      ),




                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 23,
                        child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                       Text("الكشف :${doctorData?.amount} جنيه",
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),),



                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 27,
                        child: Image.asset("assets/images/waitingtime.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.45,
                        child:  Text("مدة الأنتظار:${doctorData?.waiting} دقيقة",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),),

                      ),




                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 27,
                        child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.18,
                        child: const Text("16754 ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),),

                      ),




                    ],
                  ),
                  doctorData?.schedule?.length == 0?Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.7,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: kBlueColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text("ليس هناك مواعيد متاح حتى الان",
                              style: TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: Get.width*0.08,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: kGreenColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.favorite,color: kWhiteColor,),
                          ),
                        ),
                      ),

                    ],
                  ):Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>  ReservationScreen(doctorId: "${doctorData?.id??0}",));
                          },
                          child: Container(
                            width: Get.width*0.27,
                            height: Get.height*0.04,
                            decoration: BoxDecoration(
                              color: kGreenColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text("احجز الأن",
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.4,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: kBlueColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text("متاح اليوم من 4 م ",
                              style: TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: Get.width*0.08,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: kGreenColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.favorite,color: kWhiteColor,),
                          ),
                        ),
                      ),

                    ],
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
