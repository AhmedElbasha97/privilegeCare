import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/hospitalDetailed/controller/hospital_detailed_controller.dart';

import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:star_rating/star_rating.dart';

class HospitalDetailedScreen extends StatelessWidget {
  final String hospitalId;
  const HospitalDetailedScreen({Key? key, required this.hospitalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalDetailedController>(
      init: HospitalDetailedController(),
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
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child:  const Center(
                      child:Icon(
                        Icons.favorite_border_rounded,
                        color: kBlueColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){

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
        body: RawScrollbar(
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
                  SizedBox(height: 20,),
                  Container(
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
                          child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("مستشفي الصفوة",
                      style: TextStyle(
                          fontFamily: fontFamilyName,

                          color: kBlueColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),),
                  ),
                  SizedBox(height: 10,),
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
                            SizedBox(width: 5,),
                            const Column(
                              children: [
                                Text("التخصصات",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),),
                                SizedBox(height: 5,),
                                Text("20 تخصص",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w800,
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
                            SizedBox(width: 5,),
                            const Column(
                              children: [
                                Text("الدكاترة",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),),
                                SizedBox(height: 5,),
                                Text("20 دكتور",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w800,
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
                            SizedBox(width: 5,),
                             const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("التحاليل",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
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
                            SizedBox(width: 5,),
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
                  ),
                  const SizedBox(height: 20,),
                  CarouselSlider.builder(
                    carouselController: controller.cController,
                    itemCount: 5,
                    itemBuilder: (context, index, realIdx){
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: Get.width*0.9,
                              height: Get.height*0.2,

                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:  const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/doctor banner home.png'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
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
                                    "${controller.currentIndex+1}/5",
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

                    },
                    options: CarouselOptions(
                        height: Get.height*0.23,
                        initialPage: 0,
                        onPageChanged: (index,_){controller.selectingPage(index);},
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1,

                        autoPlay: true),
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
                    child:  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين في مختلف التخصصات الطبية ومتعاقده مع كافه النقابات والعديد من شركات الرعاية  وتضم عيادات في جميع التخصصات الطبية وأطباء على أعلى مستوى من الجاهزية والخبرة.",

                        style: TextStyle(
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
                        height: 25,
                        width: 20,
                        child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                      ),
                        const SizedBox(width: 10,),
                        Container(
                          width: Get.width*0.6,
                          child:  const Text("المهندسين شارع شهاب",
                            style: TextStyle(
                                fontFamily:fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                            textAlign: TextAlign.start,
                          ),

                        ),




                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SizedBox(
                        height: 10,
                        width: 27,
                        child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                      ),
                        const SizedBox(width: 10,),
                        Container(
                          width: Get.width*0.18,
                          child: const Text("16361",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: Get.width*0.9,
                    height: Get.height*0.2,

                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black12,
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("عرض المزيد من التفاصيل",
                      style: TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),),
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          controller.selectingCategory(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("التحليل",
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==1?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          controller.selectingCategory(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("الأشعة",
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==2?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  controller.currentActivePage==0?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                            ),
                            const Text( "دكتور احمد حسن",

                              style: TextStyle(
                                  height: 1,
                                  fontFamily:fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                            const SizedBox(height: 5,),
                            const Text("استشاري نساء وتوليد",
                              style: TextStyle(
                                  height: 1,
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                          ],
                        ),  Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                            ),
                            const Text( "دكتور احمد حسن",

                              style: TextStyle(
                                  height: 1,
                                  fontFamily:fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                            const SizedBox(height: 5,),
                            const Text("استشاري نساء وتوليد",
                              style: TextStyle(
                                  height: 1,
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                          ],
                        ),  Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                            ),
                            const Text( "دكتور احمد حسن",

                              style: TextStyle(
                                  height: 1,
                                  fontFamily:fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                            const SizedBox(height: 5,),
                            const Text("دكتور احمد حسن",
                              style: TextStyle(
                                  height: 1,
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),),
                          ],
                        ),
                      ],
                    ),
                  ):controller.currentActivePage==1?Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.9,
                          height: Get.height*0.2,

                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration:  const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage('assets/images/doctor banner home.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),

                        ),
                      ),
                      Container(
                        width: Get.width,
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("عن قسم التحليل",
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
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين في مختلف التخصصات الطبية ومتعاقده مع كافه النقابات والعديد من شركات الرعاية  وتضم عيادات في جميع التخصصات الطبية وأطباء على أعلى مستوى من الجاهزية والخبرة.",

                            style: TextStyle(
                                fontFamily: fontFamilyName,

                                color: kGreenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),),
                        ),
                      ),
                    ],
                  ):Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.9,
                          height: Get.height*0.2,

                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration:  const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage('assets/images/doctor banner home.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),

                        ),
                      ),
                      Container(
                        width: Get.width,
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("عن قسم الأشعة",
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
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشاريين في مختلف التخصصات الطبية ومتعاقده مع كافه النقابات والعديد من شركات الرعاية  وتضم عيادات في جميع التخصصات الطبية وأطباء على أعلى مستوى من الجاهزية والخبرة.",

                            style: TextStyle(
                                fontFamily: fontFamilyName,

                                color: kGreenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),),
                        ),
                      ),
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