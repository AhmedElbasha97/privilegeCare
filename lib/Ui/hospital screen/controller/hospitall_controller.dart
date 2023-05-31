// ignore_for_file: prefer_typing_uninitialized_variables

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
import 'package:privilegecare/Utils/memory.dart';

class HospitalController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyListData = [];
  List<HospitalListModel>? hospitalListData = [];
  int screenIndex = 3;
 int selectedIndex = 0;

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
          content: Text(' تم حذف المستشفى $hospitalName من قائمة المفضله  '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 7000), () {
          update();});
      } else {
        var data;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: data?.msg
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
          content: Text(' تم اضاف المستشفى $hospitalName الى قائمة المفضلة '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(const Duration(milliseconds: 7000), () {
          update();});
      } else {
        var data;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: data?.msg
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

    isLoading = false;
    update();
  }
  selectingTag(int index) async {
    isLoading = true;
    update();
    hospitalListData = await HospitalServices.getHospitalList("$index");

    isLoading = false;

    selectedIndex = index;
    update();
  }
}