// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations

import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/filter/filter_screen.dart';
import 'package:privilegecare/Ui/hospital%20screen/controller/hospitall_controller.dart';
import 'package:privilegecare/Ui/hospital%20screen/widget/hospital_cell_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

import '../../Utils/localization_services.dart';

class HospitalScreens extends StatefulWidget {

  const HospitalScreens({Key? key}) : super(key: key);

  @override
  State<HospitalScreens> createState() => _HospitalScreensState();
}

class _HospitalScreensState extends State<HospitalScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 3,),
          body: GetBuilder<HospitalController>(
            init: HospitalController(),
            builder: (controller) => DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: CustomText('Tap back again to leave'),
              ),
              child: SizedBox.expand(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in right direction.
                    if (details.delta.dx > 0) {
                      Get.to(()=>const FilterScreen());
                    }

                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      Get.to(()=>const HomeScreen());
                    }
                  },
                  child: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child:controller.hasNoData?NoDataWidget(refreshedFunc: (){}, text: noHospData.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: false) :Column(
                      children: [
                        SizedBox(
                          height: Get.height*0.12,
                          width: Get.width*0.5,
                          child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Container(
                            color: Colors.white,
                            height: Get.height*0.05,
                            width: Get.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.specialtyListData?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildChip( Get.find<StorageService>().activeLocale == SupportedLocales.english?"${controller.specialtyListData?[index].nameEn??""}":controller.specialtyListData?[index].name??"",controller.selectedIndex==index,
                                        (){
                                  controller.selectingTag(index);
                                    },"${Services.baseUrl}${controller.specialtyListData?[index].image}"
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 10,),
                        controller.isLoading?Loader(width: Get.width*0.9,
                          height: Platform.isAndroid?Get.height*0.65:Get.height*0.6,):controller.hasNoDataSpecialty?NoDataWidget(width: Get.width*0.9,
                            height: Platform.isAndroid?Get.height*0.65:Get.height*0.6,refreshedFunc: (){}, text: noHospDataInSpec.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: false):Container(
                          width: Get.width*0.9,
                          height: Platform.isAndroid?Get.height*0.65:Get.height*0.6,
                          child: RawScrollbar(
                            controller: controller.sController,
                            thumbColor: kBlueColor,
                            radius: const Radius.circular(20),
                            thickness: 1,
                            child: ListView.builder(
                              controller: controller.sController,
                              itemCount:controller.hospitalListData?.length,

                              itemBuilder: (_,index){
                                return   Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: HospitalCellWidget(hospitalData: controller.hospitalListData?[index], addOrRemoveFromFavorite: (){
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
                                        "${controller.hospitalListData?[index].id}",
                                        context,
                                            Get.find<StorageService>().activeLocale == SupportedLocales.english?"${controller.hospitalListData?[index].nameEn ?? ""}":controller.hospitalListData?[index].name ?? "");

                                  }
                                  }),
                                );
                              },
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

Widget _buildChip(String label, bool isSelected,Function onPressed,String imageUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: ActionChip(
      elevation: 8.0,
      padding: const EdgeInsets.all(.0),
      avatar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kGreenColor,width: 1),
          borderRadius: BorderRadius.circular(50)
        ),
        child: CircleAvatar(
          backgroundColor: kWhiteColor,

          child:  SizedBox(
            height: 30,
            width:30,
            child: Image.network(imageUrl,fit: BoxFit.fitWidth,),
          ),
        ),
      ),
      label: CustomText(label,style: TextStyle(
          fontFamily: fontFamilyName,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: isSelected?kWhiteColor:kBlueColor
      ),),
      onPressed: () {
        onPressed();

      },
      backgroundColor: isSelected?kBlueColor:kWhiteColor,
      shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: isSelected?kWhiteColor:kBlueColor,
          )),
    ),
  );
}