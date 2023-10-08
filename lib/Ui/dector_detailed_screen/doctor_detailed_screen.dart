// ignore_for_file: sized_box_for_whitespace, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/controller/doctor_detailed_controller.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/comment_widget.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/schedules_widget.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/video_player_widget.dart';
import 'package:privilegecare/Ui/reservationScreen/reservation_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:star_rating/star_rating.dart';

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
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
            Get.delete<DoctorDetailedController>();
          },),
          centerTitle: true,
          title:   CustomText(
            doctorDetailedTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
          actions: [InkWell(
            onTap: (){
              controller.screenIndex = 3;
      if(Get.find<StorageService>().getId == "0") {

      CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      title: "",
        text: addToFavText.tr,
      textTextStyle: const TextStyle(
      fontFamily: fontFamilyName,
      color: kBlueColor,
      fontWeight: FontWeight.w800,
      fontSize: 15),
        onConfirmBtnTap: (){
          controller.screenIndex = 1;
        },
        onCancelBtnTap:(){
          controller.screenIndex = 2;
        },
        confirmBtnText: signInProfile.tr,
        cancelBtnText: signUpProfile.tr,
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
      ).then((value){
        controller.goToScreen();
      });
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
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?.image??""}",
                                  imageBuilder: ((context, image){
                                    return  Container(
                                        height: 80,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: image,
                                            fit: BoxFit.cover,
                                          ),


                                        )
                                    );
                                  }),
                                  placeholder: (context, image){
                                    return  const Center(child: CircularProgressIndicator(color: kBlueColor,));

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
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorData?.nameEn??"":controller.doctorData?.name??"",

                                      style: const TextStyle(
                                          height: 1,
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),),
                                    const SizedBox(height: 5,),
                                    CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorData?.specialistEn??"":controller.doctorData?.specialist??"",
                                      style: const TextStyle(
                                          height: 1,
                                          fontFamily: fontFamilyName,
                                          color: kGreenColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),),
                                    const SizedBox(height: 5,),
                                    StarRating(
                                      color: kGreenColor,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      length: 5,
                                      rating: 0.0,
                                      between: 0,
                                      starSize: 20,
                                      onRaitingTap: (rating) {

                                      },
                                    ),
                                    const SizedBox(height: 5,),
                                    controller.doctorData?.visitors == 0?
                                    CustomText(noReviewsOnDoc.tr,
                                      style: const TextStyle(
                                          height: 1,
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),) :
                                    CustomText("${reviewsOnDoc1.tr}${controller.doctorData?.visitors??0} ${reviewsOnDoc2.tr}",
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
                                        child: CustomText("${controller.doctorData?.waiting??0} ${waitingTimeDocDetailedScreenText1.tr}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kGreenColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      CustomText(waitingTimeDocDetailedScreenText2.tr,
                                        style: const TextStyle(
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
                                        child: CustomText("${controller.doctorData?.amount??0}${priceDocDetailedScreenText1.tr}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      CustomText(priceDocDetailedScreenText2.tr,
                                        style: const TextStyle(
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
                                        child: CustomText(controller.doctorData?.hosp??"",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          controller.showDoctorLocation();
                                        },
                                        child:  CustomText(showOnGoogleMap.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
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
                InkWell(
                  onTap: (){
                    controller.callNumber(controller.doctorData?.phone??"");
                  },
                  child: Padding(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                                width: 27,
                                child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                              ),
                              const SizedBox(width: 10,),
                              Container(
                                width: Get.width*0.4,
                                child:  CustomText(controller.doctorData?.phone??"",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),),

                              ),




                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                controller.doctorData?.video == "0" ?Padding(
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
                    Image.asset("assets/images/noVideo.png",height: Get.width*0.23,),
                      Container(
                          width: Get.width*0.5,
                          child: CustomText(noVideo.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                    ],
                    ),
                    ),
                    )))): VideoPlayerWidget(videoPlayer: 'https://privilegecare.net/${controller.doctorData?.video??""}', videoPlayerController: controller.videoPlayerController,),
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
                              Container(

                                    width: Get.width*0.5,
                                  child: CustomText(noTimeDocDetailedScreen.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                            ],
                          ),
                        ),
                      ):Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const SizedBox(height: 10,),
                          Center(
                           child:  CustomText(timeDocDetailedScreenText1.tr,
                             style: const TextStyle(
                                 fontFamily: fontFamilyName,
                                 color: kBlueColor,
                                 fontWeight: FontWeight.w700,
                                 fontSize: 15),),
                         ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              if(controller.doctorData?.video != "0") {
                                controller.videoPlayerController.pause();
                              }
                              Get.to(  ReservationScreen(doctorId: "${controller.doctorData?.id??0}",));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kBlueColor,size: 40,),onPressed: (){
                              },),
                                Container(
                                  height: 130,
                                  width: Get.width*0.68,
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
                           Center(
                            child:  CustomText(timeDocDetailedScreenText2.tr,
                              style: const TextStyle(
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
                                        controller.doctorData?.point == 0? CustomText(noPointEarned.tr,
                                          style: const TextStyle(
                                              height: 1,
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),):CustomText("${pointDocDetailedScreenText1.tr}${controller.doctorData?.point??0}${pointDocDetailedScreenText2.tr}",
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
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 7.0),
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
                                    CustomText("5/${controller.doctorData?.hospRate??0} ${placeReview.tr}",
                                      style: const TextStyle(
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
                                    CustomText("5/${controller.doctorData?.doctorRate??0}${doctorReview.tr}",
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
                                        CustomText(doctorInformation.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color: kBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),),
                                        Container(
                                          width: Get.width*0.7,
                                          child:  CustomText(controller.doctorData?.details??"",
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
                            child:  Padding(
                              padding: const EdgeInsets.fromLTRB(30,0,30,0),
                              child: CustomText(doctorReviewsTitle.tr,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: Get.width,
                            child:   controller.doctorData?.visitors == 0?
                            CustomText(noReviewsOnDoc.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),) :CustomText("${reviewsOnDoc1.tr}${controller.doctorData?.visitors??0} ${reviewsOnDoc2.tr}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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

                                      StarRating(
                                        color: kGreenColor,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        length: 5,
                                        rating: double.parse("${controller.doctorData?.doctorRate??0}"),
                                        between: 0,
                                        starSize: 20,
                                        onRaitingTap: (rating) {

                                        },
                                      ),
                                      const SizedBox(height: 10,),
                                      CustomText(doctorReview.tr,
                                        style: const TextStyle(
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

                                      StarRating(
                                        color: kGreenColor,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        length: 5,
                                        rating: double.parse("${controller.doctorData?.hospRate??0}"),
                                        between: 0,
                                        starSize: 20,
                                        onRaitingTap: (rating) {

                                        },
                                      ),
                                      const SizedBox(height: 10,),
                                      CustomText(placeReview.tr,
                                        style: const TextStyle(
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
                        controller.commentHasNodData?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          Image.asset("assets/images/noReviews.png",height: Get.width*0.23,),
                            CustomText(noReviews.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                        ],):Column(
                          children: controller.comments!.map((e){
                            return CommentWidget(data: e);
                          }).toList(),
                        )
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
