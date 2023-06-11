import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/widget/doctor_cell_widget.dart';
import 'package:privilegecare/Ui/filter/controller/filter_controller.dart';
import 'package:privilegecare/Ui/hospital%20screen/widget/hospital_cell_widget.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

class AdvancedSearchScreen extends StatelessWidget {


  const AdvancedSearchScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 4,),
        body: GetBuilder<FilterController>(
          init: FilterController(),
          builder: (controller) => RawScrollbar(
            thumbColor: kBlueColor,
            radius: const Radius.circular(20),
            thickness: 5,
            child: SingleChildScrollView(
              controller: controller.sController,
              child: Column(
                children: [

                  SizedBox(
                    height: Get.height*0.12,
                    width: Get.width*0.5,
                    child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                  ),

                  const SizedBox(height: 10,),


                  controller.isLoading?Loader(height: Get.height*0.65,width: Get.width,):
                  controller.hasNoData?NoDataWidget(refreshedFunc: (){
                  }, text: controller.choosenSearchType=="D"?noSearchDocData.tr:noSearchHospData.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: false,height: Get.height*0.7,):
                  Container(
                    width: Get.width,
                    height: Get.height*0.7,
                    color: kLightGrayColor,
                    child: RawScrollbar(
                      thumbColor: kBlueColor,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView.builder(
                        itemCount:  controller.choosenSearchType=="D"?controller.doctorsData?.length:controller.hospitalListData?.length,
                        controller: controller.sController,
                        itemBuilder: (_,index){
                          return controller.choosenSearchType=="D"? DoctorCellWidget(doctorData: controller.doctorsData?[index], addingToFavorite: (){
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
                                  Get.to(()=> const LoginScreen());
                                },
                                onCancelBtnTap:(){
                                  Get.to(()=> const SignUpScreen());
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


                              );
                            }else{
                              controller.addingOrRemovingFromFavorite(
                                  "${controller.doctorsData?[index].id}",
                                  context,
                                  controller.doctorsData?[index].name ?? "");

                            }},): HospitalCellWidget(hospitalData: controller.hospitalListData?[index], addOrRemoveFromFavorite: (){
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
                            Get.to(()=> const LoginScreen());
                            },
                            onCancelBtnTap:(){
                            Get.to(()=> const SignUpScreen());
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


                            );
                            }else{
                            controller.addingOrRemovingFromFavorite(
                            "${controller.hospitalListData?[index].id}",
                            context,
                            controller.hospitalListData?[index].name ?? "");
                          }
                            });
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