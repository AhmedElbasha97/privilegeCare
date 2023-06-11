// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Services/hospital_services.dart';
import 'package:privilegecare/Services/specialist_services.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';

class HospitalController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyListData = [];
  List<HospitalListModel>? hospitalListData = [];
  int screenIndex = 3;
 int selectedIndex = 0;
 bool hasNoData = false;
 bool hasNoDataSpecialty = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  goToScreen(){
    if(screenIndex == 1){
      Get.to(()=> const LoginScreen());
    }else if(screenIndex == 2){
      Get.to(()=> const SignUpScreen());
    }
  }
  addingOrRemovingFromFavorite(String hospitalId,context,String hospitalName) async {
    if (await checkHospitalAddedOrNot(hospitalId)) {
      ResponseModel? status = await FavouriteServices
          .addOrRemoveHospitalFromFavorite(
          hospitalId, Get
          .find<StorageService>()
          .getId, "0");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: Text(' ${removeHospToFavText1.tr} $hospitalName ${removeHospToFavText2.tr}  '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 7000), () {
          update();});
      } else {
        var data;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: errorKey.tr,
            text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
        );
      }
    } else {
      ResponseModel? status = await FavouriteServices
          .addOrRemoveHospitalFromFavorite(
          hospitalId, Get
          .find<StorageService>()
          .getId, "1");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: Text(' ${addHospToFavText1.tr} $hospitalName ${addHospToFavText2.tr} '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 7000), () {
          update();});
      } else {
        var data;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: errorKey.tr,
            text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
        );
      }
    }
  }

  Future<bool> checkHospitalAddedOrNot(String hospitalId) async {
    var status = await FavouriteServices.getAddedOrNotToFavoritesHospital(hospitalId, Get.find<StorageService>().getId);
    if(status == 1){
      return true;

    }else{
      return false;

    }
  }
  getData() async{
    specialtyListData = await SpecialistServices.getAllSpecialist();
    hospitalListData = await HospitalServices.getHospitalList("$selectedIndex");
    if(hospitalListData == []||hospitalListData?.length == 0){

        hasNoData = true;

    }

    isLoading = false;
    update();
  }
  selectingTag(int index) async {
    hasNoDataSpecialty=false;
    hasNoData=false;
    isLoading = true;
    update();
    hospitalListData = await HospitalServices.getHospitalList("$index");
if(hospitalListData == []||hospitalListData?.length == 0){
  if(index == 0){
    hasNoData = true;
  }else{
    hasNoDataSpecialty = true;
  }
}
    isLoading = false;

    selectedIndex = index;
    update();
  }
}