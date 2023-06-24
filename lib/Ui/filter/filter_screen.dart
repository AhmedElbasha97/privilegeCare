// ignore_for_file: sized_box_for_whitespace

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/filter/controller/filter_controller.dart';
import 'package:privilegecare/Ui/hospital%20screen/hospitals_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) =>  SizedBox.expand(
        child: GestureDetector(
          onPanUpdate: (details) {


            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Get.to(()=>const HospitalScreens());
            }
          },
          child: Scaffold(
            bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 4,),
            appBar: AppBar(
              backgroundColor: kGreenColor,
              leading: IconButton(
                icon:   const Icon(Icons.baby_changing_station,color: kGreenColor,), onPressed: () {  },
              ),

              centerTitle: true,
              title:   CustomText(
                advancedSearchTitle.tr,
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),


            ),
              body: DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: CustomText('Tap back again to leave'),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  CustomText(searchTypeTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(

                                onTap: (){
                                  controller.choosingSearchType("H");
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
                                        child: Icon(Icons.check,size: 20,color: controller.choosenSearchType == "H"?kBlueColor:Colors.white,),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                     Text(
                                      searchType1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                      ),),
                                  ],
                                ),
                              ),
                              SizedBox(width: Get.width*0.1,),
                              InkWell(
                                onTap: (){
                                  controller.choosingSearchType("D");
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
                                        child: Icon(Icons.check,size: 20,color: controller.choosenSearchType == "D"?kBlueColor:Colors.white,),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    CustomText(
                                      searchType2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                      ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            width: Get.width,
                            child:  CustomText(searchAreaTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.isLoading? Center(
                          child: Container(
                            width: Get.width*0.9,
                            height: Get.height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kWhiteColor,
                              border: Border.all(width: 1, color: kGreenColor),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5, //soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  CustomText(
                                    loadingKey.tr,
                                    style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: kGreenColor,
                                      height: 1,
                                      letterSpacing: -1,
                                    ),
                                  ) .animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color: kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                  const SizedBox(height: 10,),
                                  Image.asset("assets/images/horizontalLogo.png",width: 150,height: 150,).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ],
                              ),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())

                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ):
                        PopupMenuButton<String>(
                          itemBuilder: (context) =>
                              controller.governmentData!.map((e){
                                return   PopupMenuItem(
                                  value:"${e.id}",
                                  textStyle: const TextStyle(
                                      color: kBlueColor,
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w700),
                                  onTap: (){
                                    controller.choosingPlace(e);
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        CustomText(
                                          Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn??"":e.name??"",
                                          style: const TextStyle(
                                              color: kBlueColor,
                                              fontFamily: fontFamilyName,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: kGreenColor,
                                          height: 1,
                                          thickness: 1,
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),

                          child: Center(
                            child: Container(
                              width: Get.width*0.9,
                              height: Get.height*0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child:   Center(
                                child:  controller.placeName==""? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchAreaText1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.place_outlined,color: kGreenColor,size: 30,)

                                  ],
                                ):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchAreaText2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width*0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            controller.placeName,
                                            style: const TextStyle(
                                                fontFamily: fontFamilyName,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(height: 10,),
                                          const Divider(
                                            color: kGreenColor,
                                            height: 1,
                                            thickness: 1,
                                            endIndent: 0,
                                            indent: 0,
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  Text(searchSpecTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.isLoading? Center(
                          child: Container(
                            width: Get.width*0.9,
                            height: Get.height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kWhiteColor,
                              border: Border.all(width: 1, color: kGreenColor),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5, //soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  CustomText(
                                    loadingKey.tr,
                                    style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: kGreenColor,
                                      height: 1,
                                      letterSpacing: -1,
                                    ),
                                  ) .animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color: kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                  const SizedBox(height: 10,),
                                  Image.asset("assets/images/horizontalLogo.png",width: 150,height: 150,).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ],
                              ),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())

                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ):
                        PopupMenuButton<String>(
                          itemBuilder: (context) =>
                              controller.specialtyListData!.map((e){
                                return   PopupMenuItem(
                                  value:"${e.id}",
                                  textStyle: const TextStyle(
                                      color: kBlueColor,
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w600),
                                  onTap: (){
                                    controller.choosingSpecialty(e);
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width:30,
                                              child: Image.network("https://privilegecare.net${e.image}",fit: BoxFit.fitWidth,),
                                            ),const SizedBox(width: 10,),
                                            CustomText(
                                              Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn??"":e.name??"",
                                              style: const TextStyle(
                                                  color: kBlueColor,
                                                  fontFamily: fontFamilyName,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: kGreenColor,
                                          height: 1,
                                          thickness: 1,
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),

                          child: Center(
                            child: Container(
                              width: Get.width*0.9,
                              height: Get.height*0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child:   Center(
                                child:  controller.specialtyName==""? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchSpecText1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 25,
                                      width: 20,
                                      child: Image.asset("assets/images/specification.png",fit: BoxFit.fitHeight,),
                                    ),

                                  ],
                                ):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchSpecText2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width*0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                         Row(
                                           children: [
                                             SizedBox(
                                               height: 30,
                                               width:30,
                                               child: Image.network(controller.specialtyImageURl,fit: BoxFit.fitWidth,),
                                             ),const SizedBox(width: 10,),
                                             Text(controller.specialtyName,
                                               style: const TextStyle(
                                                   fontFamily: fontFamilyName,
                                                   color: kBlueColor,
                                                   fontWeight: FontWeight.w600,
                                                   fontSize: 15),),
                                           ],
                                         ),
                                          const SizedBox(height: 10,),
                                          const Divider(
                                            color: kGreenColor,
                                            height: 1,
                                            thickness: 1,
                                            endIndent: 0,
                                            indent: 0,
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const SizedBox(
                          height: 10,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  Text(searchLevelTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const SizedBox(
                          height: 10,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():controller.isLoading? Center(
                          child: Container(
                            width: Get.width*0.9,
                            height: Get.height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kWhiteColor,
                              border: Border.all(width: 1, color: kGreenColor),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5, //soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  CustomText(
                                     loadingKey.tr,
                                    style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: kGreenColor,
                                      height: 1,
                                      letterSpacing: -1,
                                    ),
                                  ) .animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color: kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                  const SizedBox(height: 10,),
                                  Image.asset("assets/images/horizontalLogo.png",width: 150,height: 150,).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kLightGrayColor)
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ],
                              ),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())

                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ):
                        PopupMenuButton<String>(
                          itemBuilder: (context) =>
                              controller.levelListData!.map((e){
                                return   PopupMenuItem(
                                  value:"${e.id}",
                                  textStyle: const TextStyle(
                                      color: kBlueColor,
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w600),
                                  onTap: (){
                                    controller.choosingLevel(e);
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        CustomText(
                                          Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn??"":e.name??"",
                                          style: const TextStyle(
                                              color: kBlueColor,
                                              fontFamily: fontFamilyName,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: kGreenColor,
                                          height: 1,
                                          thickness: 1,
                                          endIndent: 0,
                                          indent: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),

                          child: Center(
                            child: Container(
                              width: Get.width*0.9,
                              height: Get.height*0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child:   Center(
                                child:  controller.levelName==""? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchLevelText1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 25,
                                      width: 20,
                                      child: Image.asset("assets/images/specification.png",fit: BoxFit.fitHeight,),
                                    ),

                                  ],
                                ):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                       searchLevelText2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width*0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(controller.levelName,
                                            style: const TextStyle(
                                                fontFamily: fontFamilyName,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),),
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
                              ),
                            ),
                          ),
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const SizedBox(
                          height: 10,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  CustomText(searchPriceTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: Get.width*0.9,
                            height: Get.height*0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kBlueColor,width: 1)
                            ),
                            child:   Center(
                              child: Wrap(
                                children: [
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      showValueIndicator: ShowValueIndicator.always,
                                      thumbShape:
                                      const RoundSliderThumbShape(enabledThumbRadius: 15),
                                    ),
                                    child: RangeSlider(
                                      min: 0,
                                      max: 1000,
                                      activeColor:kGreenColor,
                                      inactiveColor: kBlueColor,
                                      labels: RangeLabels(
                                        controller.currentRangeValues.start
                                            .round()
                                            .toString()
                                            ,
                                        controller.currentRangeValues.end
                                            .round()
                                            .toString()
                                            ,
                                      ),
                                      values:controller.currentRangeValues,
                                      onChanged: (value) {
                                        controller.choosingPriceRange(value);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: Get.width*0.35,
                              height: Get.height*0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.startPriceRange,
                                  maxLength: 3,
                                  onFieldSubmitted: controller.changeStartPrice,
                                  style:  const TextStyle(
                                    fontSize: 15,
                                    fontFamily: fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    color: kGrayColor,
                                  ),
                                  decoration:   InputDecoration(
                                      labelText: searchPriceText1.tr,
                                      counterText: '',

                                      labelStyle: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15
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
                            ),
                            Container(
                              width: Get.width*0.35,
                              height: Get.height*0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  maxLength: 3,
                                  controller: controller.endPriceRange,
                                  onFieldSubmitted: controller.changeEndPrice,
                                  style:  const TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    color: kGrayColor,
                                  ),
                                  decoration:   InputDecoration(
                                      labelText: searchPriceText2.tr,
                                      counterText: '',

                                      labelStyle: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  CustomText(searchRateTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PopupMenuButton<String>(
                          itemBuilder: (context) =>
                              controller.ratingsListData.map((e){
                                return   PopupMenuItem(
                                  value:e.title,
                                  textStyle: const TextStyle(
                                      color: kBlueColor,
                                      fontFamily: fontFamilyName,
                                      fontWeight: FontWeight.w700),
                                  onTap: (){
                                    controller.choosingRating(e);
                                  },
                                  child: SizedBox(
                                    width: Get.width*0.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                             e.title??"",
                                              style: const TextStyle(
                                                  color: kBlueColor,
                                                  fontFamily: fontFamilyName,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            StarRating(
                                              color: kGreenColor,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              length: 5,
                                              rating: double.parse(e.id??""),
                                              between: 0,
                                              starSize: 20,
                                              onRaitingTap: (rating) {

                                              },
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                                );
                              }).toList(),

                          child: Center(
                            child: Container(
                              width: Get.width*0.9,
                              height: Get.height*0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kBlueColor,width: 1)
                              ),
                              child:   Center(
                                child:  controller.ratingName==""? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      searchRateText1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitHeight,),
                                    ),

                                  ],
                                ):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      searchRateText2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: Get.width*0.5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                controller.ratingName,
                                                style: const TextStyle(
                                                    fontFamily: fontFamilyName,
                                                    color: kBlueColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),

                                              ),
                                              StarRating(
                                                color: kGreenColor,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                length: 5,
                                                rating: double.parse(controller.ratingId),
                                                between: 0,
                                                starSize: 20,
                                                onRaitingTap: (rating) {

                                                },
                                              )
                                            ],
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
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: Get.width,
                            child:  CustomText(searchReservationTypeTitle.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():SizedBox(
                          width: Get.width,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(

                                onTap: (){
                                  controller.choosingSearchDisclose("1");
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
                                        child: Icon(Icons.check,size: 20,color: controller.choosenDiscloseType == "1"?kBlueColor:Colors.white,),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    CustomText(
                                       searchReservationTypeText1.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                      ),),
                                  ],
                                ),
                              ),
                              SizedBox(width: Get.width*0.1,),
                              InkWell(
                                onTap: (){
                                  controller.choosingSearchDisclose("0");
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
                                        child: Icon(Icons.check,size: 20,color: controller.choosenDiscloseType == "0"?kBlueColor:Colors.white,),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    CustomText(
                                      searchReservationTypeText2.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                      ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const SizedBox(
                          height: 10,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const Divider(
                          color: kGreenColor,
                          height: 1,
                          thickness: 2,
                          endIndent: 0,
                          indent: 0,
                        ),
                        controller.choosenSearchType != "D"?const SizedBox():const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (){
                            controller.startSearching();

                          },
                          child: Center(
                            child: Container(
                              width: Get.width*0.5,
                              height: Get.height*0.07,
                              decoration: BoxDecoration(
                                color: kBlueColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:  Center(
                                child:  CustomText(
                                  advancedSearchBTN.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
          ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
