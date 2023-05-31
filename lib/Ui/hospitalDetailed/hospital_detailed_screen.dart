// ignore_for_file: sized_box_for_whitespace


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/hospitalDetailed/controller/hospital_detailed_controller.dart';

import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:star_rating/star_rating.dart';

class HospitalDetailedScreen extends StatelessWidget {
  final String hospitalId;
  const HospitalDetailedScreen({Key? key, required this.hospitalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalDetailedController>(
      init: HospitalDetailedController(hospitalId),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: false,
          title:  const Text(
            "بيانات المستشفي",
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
          actions: [InkWell(
            onTap: (){
            },

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){

            controller.screenIndex = 3;
            if(Get.find<StorageService>().getId == "0") {

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
            controller.screenIndex = 1;
            },
            onCancelBtnTap:(){
            controller.screenIndex = 2;
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
            ).then((value){
            controller.goToScreen();
            });
            }else{
            controller.addingOrRemovingFromFavorite(
            "${controller.hospitalData?.id}",
            context,
            controller.hospitalData?.name ?? "");
            }},

              child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10),

              ),
              child:  Center(
                child: controller.hospitalAddedOrNot?const Icon(
                  Icons.favorite,
                  color: kBlueColor,
                ):const Icon(
                  Icons.favorite_border_rounded,
                  color: kBlueColor,
                ),
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
        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 3,),
        backgroundColor: kLightGrayColor,
        body: controller.isLoading?const Loader():RawScrollbar(
          thumbColor: kBlueColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
            controller: controller.sController,
            child:  Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
              controller.hospitalData?.image?.length!=0? CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "https://privilegecare.net${controller.hospitalData?.image?[0]??""}",
                    imageBuilder: ((context, image){
                      return   Container(
                        height: Get.height*0.11,
                        width: Get.width*0.3,
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
                        width: Get.width*0.3,
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
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill,
                            ),


                          )
                      );
                    },
                  ):Container(
              height: 80,
              width: 80,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ),
              )
              ),

                  const SizedBox(height: 20,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.hospitalData?.nameEn??"":controller.hospitalData?.name??"",
                      style: const TextStyle(
                          fontFamily: fontFamilyName,

                          color: kBlueColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),),
                  ),
                  const SizedBox(height: 10,),
                  StarRating(
                    color: kGreenColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    length: 5,
                    rating: (controller.hospitalData?.rate??0).toDouble(),
                    between: 0,
                    starSize: 20,
                    onRaitingTap: (rating) {

                    },
                  ),
                  controller.hospitalData?.lab==0 && controller.hospitalData?.xray==0 ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                             Column(
                              children: [
                                const Text("التخصصات",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.specCount??0} تخصص",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                             Column(
                              children: [
                                const Text("الدكاترة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.doctors??0} دكتور",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),


                      ],
                    ),
                  ):controller.hospitalData?.lab==1 && controller.hospitalData?.xray == 1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("التخصصات",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.specCount??0} تخصص",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 5,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("الدكاترة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.doctors??0} دكتور",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 5,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/analysis_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("التحاليل",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 5,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/rays_icons.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("الأشعة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ):controller.hospitalData?.lab==1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("التخصصات",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.specCount??0} تخصص",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("الدكاترة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.doctors??0} دكتور",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/analysis_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("التحاليل",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ):controller.hospitalData?.xray==1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("التخصصات",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.specCount??0} تخصص",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                const Text("الدكاترة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                Text("${controller.hospitalData?.doctors??0} دكتور",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/rays_icons.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("الأشعة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ):const SizedBox(),
                  const SizedBox(height: 20,),
                  controller.hospitalData?.image?.length!=0?CarouselSlider.builder(
                    carouselController: controller.cController,
                    itemCount: controller.hospitalData?.image?.length,
                    itemBuilder: (context, index, realIdx){
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "https://privilegecare.net${controller.hospitalData?.image?[index]??""}",
                        imageBuilder: ((context, image){
                          return  Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: Get.width*0.9,
                                  height: Get.height*0.2,

                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:   BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.fill),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:30,
                                    width:50,
                                    decoration:  const BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),

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
                                      child: Text(
                                        "${controller.currentIndex+1}/${controller.hospitalData?.image?.length??0}",
                                        style: const TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        placeholder: (context, image){
                          return  Padding(
                            padding:  const EdgeInsets.all(5),
                            child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))
                                ),
                                child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
                          );
                        },
                        errorWidget: (context, url, error){
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/no_data_slideShow.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))

                              )
                          );
                        },
                      );

                    },
                    options: CarouselOptions(
                        height: Get.height*0.23,
                        initialPage: 0,
                        onPageChanged: (index,_){controller.selectingPage(index);},
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1,

                        autoPlay: true),
                  ):Container(
                      width: Get.width*0.9,
                      height: Get.height*0.2,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/no_data_slideShow.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))

                      )
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child:  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("عن المستشفي",
                        style: TextStyle(
                            fontFamily: fontFamilyName,

                            color: kBlueColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child:   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(controller.hospitalData?.details??"",

                        style: const TextStyle(
                            fontFamily: fontFamilyName,

                            color: kGreenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ SizedBox(
                        height: 15,
                        width: 20,
                        child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                      ),
                        const SizedBox(width: 10,),
                        Container(
                          width: Get.width*0.6,
                          child:   Text(controller.hospitalData?.address??"",
                            style: const TextStyle(
                                fontFamily:fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                            textAlign: TextAlign.start,
                          ),

                        ),




                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.callNumber(controller.hospitalData?.phone??"");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [SizedBox(
                          height: 8,
                          width: 20,
                          child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                        ),
                          const SizedBox(width: 10,),
                          Container(
                            width: Get.width*0.18,
                            child:  Text(controller.hospitalData?.phone??"",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "https://privilegecare.net${controller.hospitalData?.mapImage??""}",
                    imageBuilder: ((context, image){
                      return  Container(
                        width: Get.width*0.9,
                        height: Get.height*0.2,

                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration:   BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              color: Colors.black12,
                            ),
                          ],
                        ),

                      );
                    }),
                    placeholder: (context, image){
                      return  Padding(
                        padding:  const EdgeInsets.all(5),
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))
                            ),
                            child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
                      );
                    },
                    errorWidget: (context, url, error){
                      return Container(
                          width: Get.width*0.9,
                          height: Get.height*0.2,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/no_data_slideShow.png"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))

                          )
                      );
                    },
                  ),

                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      controller.showHospitalLocation();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("عرض المزيد من التفاصيل",
                        style: TextStyle(
                            fontFamily: fontFamilyName,
                            color: kGreenColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: controller.hospitalData?.lab==1 && controller.hospitalData?.xray == 1?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:(){
                          controller.selectingCategory(0);
                        },
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("الدكاترة",
                            style: TextStyle(
                                fontFamily: fontFamilyName,

                                color: controller.currentActivePage==0?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ),
                      controller.hospitalData?.lab==1?InkWell(
                        onTap:(){
                          controller.selectingCategory(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("التحليل",
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==1?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ):const SizedBox(),
                      controller.hospitalData?.xray==1?InkWell(
                        onTap:(){
                          controller.selectingCategory(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("الأشعة",
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==2?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ):const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  controller.currentActivePage==0?
                  controller.doctorHasNoData?Padding(
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
                                      Image.asset("assets/images/Doctors-rafiki.png",height: Get.width*0.23,),
                                      Container(
                                        width: Get.width*0.5,
                                          child: const Text("لم يتم تسجيل اطباء فى المستشفى حتى الان",style: TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                                    ],
                                  ),
                                ),
                              )))):
                  Container(
                    height: Get.height*0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                      itemCount: controller.doctorsData?.length,
                      controller: controller.sController,
                      itemBuilder: (_,index){
                        return   Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "https://privilegecare.net${controller.doctorsData?[index].image??""}",
                                imageBuilder: ((context, image){
                                  return  Container(
                                      height: 80,
                                      width: 80,
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
                              const SizedBox(height: 5),
                               Text( Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorsData![index].nameEn!:controller.doctorsData![index].name!,

                                style: const TextStyle(
                                    height: 1,
                                    fontFamily:fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),),
                              const SizedBox(height: 5,),
                               Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorsData![index].specialistEn!:controller.doctorsData![index].specialist!,
                                style: const TextStyle(
                                    height: 1,
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),),
                            ],
                          ),
                        );
                      }
                      )):controller.currentActivePage==1?Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.lapData?.titleEn??"":controller.lapData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,

                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.lapData?.descEn??"":controller.lapData?.desc??"",
                          style: {
                            "body": Style(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: FontSize(20),
                            ),
                          },),
                      )
                    ],
                  ):Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.xrayData?.titleEn??"":controller.xrayData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,

                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.xrayData?.descEn??"":controller.xrayData?.desc??"",
                          style: {
                            "body": Style(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: FontSize(20),
                            ),
                          },),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}