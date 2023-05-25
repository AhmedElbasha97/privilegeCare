// ignore_for_file: sized_box_for_whitespace, prefer_is_empty

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/controller/doctor_detailed_controller.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/schedules_widget.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/video_player_widget.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/reservation_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';

class DoctorDetailedScreen extends StatelessWidget {
  final String doctorId;
   const DoctorDetailedScreen({Key? key, required this.doctorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorDetailedController>(
      init: DoctorDetailedController(doctorId),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:  const Text(
            "بيانات الدكتور",
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
          actions: [InkWell(
            onTap: (){
      if("${Get.find<StorageService>().getId}" == "0") {
      CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      title: "",
      text: 'لا يمكن اضافه إلى قائمة المفضلة الا عند تسجيل الدخول او انشاء الحساب',
      textTextStyle: const TextStyle(
      fontFamily: fontFamilyName,
      color: kBlueColor,
      fontWeight: FontWeight.w800,
      fontSize: 15),
      onConfirmBtnTap: (){
      Get.to(()=> const LoginScreen());
      },
      onCancelBtnTap:(){
      Get.to(()=> const SignUpScreen());
      },
      confirmBtnText: 'تسجيل الدخول',
      cancelBtnText: 'إنشاء حساب',
      confirmBtnColor: Colors.white,
      cancelBtnTextStyle:   const TextStyle(
      fontFamily: fontFamilyName,
      color: kGreenColor,
      fontWeight: FontWeight.w800,
      fontSize: 15),
      confirmBtnTextStyle: const TextStyle(
      fontFamily: fontFamilyName,
      color: kGreenColor,
      fontWeight: FontWeight.w800,
      fontSize: 15),


      );
      }else{
      controller.addingOrRemovingFromFavorite(
      "${controller.doctorData?.id}",
      context,
      controller.doctorData?.name ?? "");
      }},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child:  Center(
                      child: controller.doctorAddedOrNot?const Icon(
                        Icons.favorite,
                        color: kBlueColor,
                      ):const Icon(
                        Icons.favorite_border_rounded,
                        color: kBlueColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      controller.shareDoctorLink();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.share,
                          color: kBlueColor,
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
        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 1,),
        backgroundColor: kLightGrayColor,
        body: controller.isLoading?const Loader():RawScrollbar(
          thumbColor: kBlueColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
            controller: controller.sController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
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
                                height: 80,
                                width: 80,
                                child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                              ),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                     Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorData?.nameEn??"":controller.doctorData?.name??"",

                                      style: const TextStyle(
                                          height: 1,
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),),
                                    const SizedBox(height: 5,),
                                     Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorData?.specialistEn??"":controller.doctorData?.specialist??"",
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
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                     Text("التقييم العام من ${controller.doctorData?.visitors??0} زائر",
                                      style: const TextStyle(
                                          height: 1,
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),),

                                  ],
                                ),


                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 27,
                                    child: Image.asset("assets/images/waitingtime.png",fit: BoxFit.fitHeight,),
                                  ),
                                  const SizedBox(width: 10,),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Get.width*0.2,
                                        child: Text("${controller.doctorData?.waiting??0} دقيقة",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kGreenColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      const Text("وقت الانتظار",
                                        style: TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),),

                                    ],
                                  ),

                                ],
                              ),
                                Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 23,
                                    child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                                  ),
                                  const SizedBox(width: 10,),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Get.width*0.2,
                                        child: Text("${controller.doctorData?.amount??0} جنيه",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      const Text("سعر الكشف",
                                        style: TextStyle(
                                            fontFamily:fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),),

                                    ],
                                  ),


                                ],
                              ),





                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                                Row(
                                children: [
                                  SizedBox(
                                  height: 25,
                                  width: 19,
                                  child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                                ),
                                  const SizedBox(width: 10,),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Get.width*0.45,
                                        child: Text(controller.doctorData?.hosp??"",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      const Text("احجز وسيصلك تفاصيل العنوان",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),),

                                    ],
                                  ),


                                ],
                              ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                controller.doctorData?.video =="0"?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                    child: Center(
                    child: Container(
                    height: 130,
                    width: Get.width*0.75,
                    child: Row(
                    children: [
                    Image.asset("assets/images/Time management-rafiki.png",height: Get.width*0.23,),
                    const Text("ليس هناك فيديو متاح الان",style: TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                    ],
                    ),
                    ),
                    )))): VideoPlayerWidget(videoPlayer: 'https://privilegecare.net/${controller.doctorData?.video??""}',),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                      child: controller.doctorData?.schedule?.length==0?Center(
                        child: Container(
                          height: 130,
                          width: Get.width*0.75,
                          child: Row(
                            children: [
                              Image.asset("assets/images/Time management-rafiki.png",height: Get.width*0.23,),
                              const Text("ليس هناك مواعيد متاح حاليا",style: TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ):Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const SizedBox(height: 10,),
                         const Center(
                           child:  Text("اختر ميعاد حجزك",
                             style: TextStyle(
                                 fontFamily: fontFamilyName,
                                 color: kBlueColor,
                                 fontWeight: FontWeight.w700,
                                 fontSize: 15),),
                         ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              Get.to(  ReservationScreen(doctorId: "${controller.doctorData?.id??0}",));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kBlueColor,size: 40,),onPressed: (){
                              },),
                                Container(
                                  height: 130,
                                  width: Get.width*0.7,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.doctorData?.schedule?.length??0,
                                  itemBuilder: (_,index){
                                    return SchedulesWidget(data: controller.doctorData!.schedule?[index]);
                                  },
                                ),
                                ),

                                IconButton(icon: const Icon(Icons.arrow_circle_left_outlined,color: kBlueColor,size: 40,),onPressed: (){
                                },),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Center(
                            child:  Text("الدخول بأسبقية الحضور",
                              style: TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                                Row(
                                  children: [

                                    SizedBox(
                                      height: 25,
                                      width: 27,
                                      child: Image.asset("assets/images/pouns.png",fit: BoxFit.fitHeight,),
                                    ),
                                    const SizedBox(width: 10,),
                                     Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("ستحصل علي ${controller.doctorData?.point??0} نقطة عند الحجز",
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),

                                      ],
                                    ),


                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitHeight,),
                                  ),
                                    const SizedBox(width: 5,),
                                    const Text("5/4.5 تقييم العيادة",
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),),


                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitHeight,),
                                  ),
                                    const SizedBox(width: 5,),
                                    const Text("5/4.5 تقييم المساعد",
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),),


                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      width: 27,
                                      child: Image.asset("assets/images/doctor info.png",fit: BoxFit.fitHeight,),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children:  [
                                        const Text("معلومات عن الدكتور",
                                          style: TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                        Container(
                                          width: Get.width*0.7,
                                          child:  Text(controller.doctorData?.details??"",
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontFamily: fontFamilyName,
                                                color: kGreenColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
                  child: SizedBox(

                    width: Get.width,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0,0,30,0),
                              child: Text("تقييمات الزائرين",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: const Text("التقييمات من 185 زائر",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            height: Get.height*0.08,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width*0.4,
                                  height: Get.height*0.08,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kBlueColor,width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white
                                  ),

                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children:  [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      const Text("تقييم الدكتور",
                                        style: TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),),



                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width*0.4,
                                  height: Get.height*0.08,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kBlueColor,width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                  ),

                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children:  [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      const Text("التقييم العام",
                                        style: TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),),



                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  const SizedBox(width: 20,),
                                  const Text("التقييم العام",
                                    style: TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),),
                                  const SizedBox(width: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    width: Get.width*0.9,
                                    child: const Text("دكتور قمة فى التواضع والأخلاق وسامعني للاخر ورد علي كل أسئلتي وطمني \nهالة  15 مارس 2023",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Divider(
                                  color: kBlueColor,
                                  height: 1,
                                  thickness: 1,
                                  endIndent: 30,
                                  indent: 10,
                                ),
                                const SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 20,),
                                  const Text("التقييم العام",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),),

                                  const SizedBox(width: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    width: Get.width*0.9,
                                    child: const Text("دكتور قمة فى التواضع والأخلاق وسامعني للاخر ورد علي كل أسئلتي وطمني \nهالة  15 مارس 2023",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Divider(
                                  color: kBlueColor,
                                  height: 1,
                                  thickness: 1,
                                  endIndent: 30,
                                  indent: 10,
                                ),
                                const SizedBox(height: 30,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
