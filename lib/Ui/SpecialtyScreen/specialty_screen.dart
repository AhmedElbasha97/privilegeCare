// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/controller/specialty_controller.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/widget/specialty_cell_widget.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/widget/specialty_loader_widget.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Ui/profileScreen/profile_screeen.dart';

import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../Utils/translation_key.dart';

class SpecialtyScreen extends StatelessWidget {
   SpecialtyScreen({Key? key}) : super(key: key);
   final ScrollController controllerScroll = ScrollController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:GetBuilder<SpecialtyController>(
        init: SpecialtyController(),
        builder: (controller) =>  SizedBox.expand(
          child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Get.to(()=>const HomeScreen());
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                Get.to(()=>ProfileScreen());
              }
            },
            child: Scaffold(
              bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 1,),
              body: DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: CustomText('Tap back again to leave'),
                ),
                child: RawScrollbar(
                    thumbColor: kBlueColor,
                    radius: const Radius.circular(20),
                    thickness: 5,
                  child: SingleChildScrollView(
                    controller: controllerScroll,
                    child: Column(
                      children: [

                        SizedBox(
                          height: Get.height*0.12,
                          width: Get.width*0.5,
                          child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>const DoctorScreen(specialistId: "0"));
                          },
                          child: Container(
                            height: Get.height*0.06,
                            width: Get.width*0.95,
                            decoration: BoxDecoration(
                              color: kBlueColor,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [ SizedBox(width: 5,), Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),
                                SizedBox(width: 70,),
                                CustomText(searchForDoctor.tr,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,

                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),),



                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Get.to(()=>const DoctorScreen(specialistId: "0"));
                          },
                          child: Container(
                            height: Get.height*0.06,
                            width: Get.width*0.95,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              border: Border.all(color: kBlueColor,width: 1),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [  SizedBox(width: 5,),
                                Icon(
                                  Icons.search_outlined,
                                  color: kGrayColor,
                                  size: 30,),
                                SizedBox(width: 15,),
                                CustomText(searchWithDoctorName.tr,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,

                                    color: kGrayColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),),



                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            width: Get.width,
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                 Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(mostChosenSpecialty.tr,
                                    style: TextStyle(
                                        fontFamily: fontFamilyName,

                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),),
                                ),
                                controller.isLoading?const SpecialtyLoaderWidget():Container(
                                  width: Get.width,
                                  child: Column(
                                    children: controller.mostChosenSpecialtyListData!.map((e){
                                      return SpecialtyCellWidget(title: Get.find<StorageService>().activeLocale == SupportedLocales.english?(e.nameEn??""):(e.name??""),imageUrl: "${Services.baseUrl}${e.image}", specialistId: "${e.id}", );
                                    }).toList() ,
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                 Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(anotherSpecialty.tr,
                                    style: TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),),
                                ),
                                controller.isLoading?const SpecialtyLoaderWidget():Container(
                                    width: Get.width,
                                    child: Column(
                                      children: controller.specialtyListData!.map((e){
                                        return SpecialtyCellWidget(title: Get.find<StorageService>().activeLocale == SupportedLocales.english?(e.nameEn??""):(e.name??""),imageUrl: "${Services.baseUrl}${e.image}",specialistId: "${e.id}" );
                                      }).toList() ,
                                    )
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
