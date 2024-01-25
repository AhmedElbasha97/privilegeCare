// ignore_for_file: sized_box_for_whitespace

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/controller/doctor_list_controller.dart';
import 'package:privilegecare/Ui/doctorsScreen/widget/doctor_cell_widget.dart';
import 'package:privilegecare/Ui/governmentScreen/govrnment_screen.dart';

import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

class DoctorScreen extends StatelessWidget {
  final String specialistId;
  final String areaId;
  final String searchName;

   const DoctorScreen({Key? key, required this.specialistId,  this.areaId = "0",this.searchName = "0"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 1,),
        body: GetBuilder<DoctorListController>(
          init: DoctorListController(specialistId,areaId,searchName),
          builder: (controller) => RawScrollbar(

            controller: controller.sController,
            thumbColor: kBlueColor,
            radius: const Radius.circular(20),
            thickness: 5,
            child: SingleChildScrollView(


              child: Column(
                children: [

                  SizedBox(
                    height: Get.height*0.12,
                    width: Get.width*0.5,
                    child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                  ),
                  controller.hasNoData?const SizedBox():InkWell(
                    onTap: (){
                      Get.off(()=> GovernmentScreen(specialistId: specialistId,searchName: controller.searchController.text,));
                    },
                    child: Container(
                      height: Get.height*0.045,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const SizedBox(width: 5,),
                          Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 30,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 30,),
                          const SizedBox(width: 90,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [

                              Container(
                                color: kDarkBlueColor,
                                child:  Row(
                                  children: [


                                    CustomText(allAreaKey.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),
                                    const Icon(Icons.arrow_downward,color: kWhiteColor,size: 18,),
                                  ],
                                ),
                              )
                            ],
                          ),



                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  controller.hasNoData?const SizedBox():Container(
                    height: Get.height*0.06,
                    width: Get.width*0.95,

                    child: TextField(
                      onChanged: (value){
                        controller.searchForDoctor(value);
                      },
                      onSubmitted: (value){
                        controller.searchForDoctor(value);
                      },
                      controller: controller.searchController,
                      cursorColor: kBlueColor,
                      textInputAction: TextInputAction.search,
                      style:  const TextStyle(
                        fontSize: 15.0,
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                      ),
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: kBlueColor,),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:   const BorderSide(color: kBlueColor,width: 3.0),
                            borderRadius: BorderRadius.circular(15)),

                          hintText: searchWithDoctorName.tr,
                          hintStyle: const TextStyle(

                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),

                          prefixIcon:   const Icon(
                            Icons.search_outlined,
                            color: kGrayColor,
                            size: 30,),
                          suffixStyle: const TextStyle(color: kGreenColor)),
                    ),

                  ),

                  controller.isLoading?Loader(height: Get.height*0.65,width: Get.width,):
                  controller.hasNoData?NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: doctorHasNoScreen1.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: true,height: Get.height*0.7,):
                  controller.searchHasNoResult?NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: doctorHasNoScreen2.tr, imgPath: "assets/images/Search-rafiki.png", hasRefreshButtonOrNot: false,height: Get.height*0.7,)
                      :controller.areaHasNoResult?
                  NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: doctorHasNoScreen3.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: true,height: Get.height*0.7,)
                  :controller.noSearchForThisArea?
                  NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: doctorHasNoScreen4.tr, imgPath: "assets/images/Search-rafiki.png", hasRefreshButtonOrNot: false,height: Get.height*0.7,)
                      :Container(

                    width: Get.width,
                    height: Get.height*0.68-kBottomNavigationBarHeight,
                    color: kLightGrayColor,
                    child: RawScrollbar(
                      thumbColor: kBlueColor,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView.builder(
                        itemCount: controller.doctorsData?.length,

                        controller: controller.sController,
                        itemBuilder: (_,index){
                          return DoctorCellWidget(doctorData: controller.doctorsData?[index], addingToFavorite: () async {
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
                              await controller.addingOrRemovingFromFavorite(
                                  "${controller.doctorsData?[index].id}",
                                  context,Get.find<StorageService>().activeLocale == SupportedLocales.english?"${controller.doctorsData?[index].nameEn ?? ""}":controller.doctorsData?[index].name ?? ""
                                  );
                              controller.update();
                            }},);
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
          );

  }
}
