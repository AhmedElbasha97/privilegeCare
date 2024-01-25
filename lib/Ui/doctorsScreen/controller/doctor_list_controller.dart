// ignore_for_file: prefer_is_empty, prefer_typing_uninitialized_variables, unnecessary_overrides

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class DoctorListController extends GetxController {

  bool isLoading = true;
  bool hasNoData = false;
  bool searchHasNoResult = false;
  bool noDoctorsInThisLocation = false;
  bool areaHasNoResult = false;
  bool noSearchForThisArea = false;
  late TextEditingController searchController;
  final ScrollController sController = ScrollController();
  List<DoctorListModel>? doctorsData = [];
  int screenIndex = 3;
  final String specialistId;
  final String locationId;

  final String searchName;

  DoctorListController(this.specialistId, this.locationId, this.searchName);

  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    getData();
    super.onInit();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<DoctorListController>();
  }
  @override
  void onClose() {

    super.onClose();
  }

  void clear() {
    searchController.clear();
  }

  getData() async {
    isLoading = true;
    update();
    doctorsData = await DoctorServices.getDoctorsInThisSpecialist(specialistId);
    if (doctorsData?.length == 0 || doctorsData == null) {
      hasNoData = true;
    } else {
      if (
      locationId != "0"
      ) {
        if (searchName != "0" && searchName != "") {
          doctorsData = await DoctorServices.searchForDoctorsWithArea(
              searchName, specialistId, locationId);
          searchController.text = searchName;
          if (doctorsData?.length == 0 || doctorsData == null) {
            noSearchForThisArea = true;
          }
        } else {
          doctorsData = await DoctorServices.searchForDoctorsWithArea(
              "", specialistId, locationId);
          if (doctorsData?.length == 0 || doctorsData == null) {
            areaHasNoResult = true;
          }
        }
      }
    }
    isLoading = false;
    update();
  }
goToScreen(){
    if(screenIndex == 1){
  Get.to(()=> const LoginScreen());}else if(screenIndex == 2){
      Get.to(()=> const SignUpScreen());
    }
}
  addingOrRemovingFromFavorite(String doctorId,context,String doctorName) async {
    if (await checkDoctorAddedOrNot(doctorId)) {
      ResponseModel? status = await FavouriteServices
          .addOrRemoveDoctorFromFavorite(
          doctorId, Get
          .find<StorageService>()
          .getId, "0");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: CustomText(' ${removeDocFromFav1.tr} $doctorName ${removeDocFromFav2.tr}  '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       update();
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
          .addOrRemoveDoctorFromFavorite(
          doctorId, Get
          .find<StorageService>()
          .getId, "1");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: CustomText( "${addDocToFav1.tr} $doctorName ${addDocToFav2.tr}" ),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        update();

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

  Future<bool> checkDoctorAddedOrNot(String doctorId) async {
    var status = await FavouriteServices.getAddedOrNotToFavoritesDoctor(doctorId, Get.find<StorageService>().getId);
    if(status == 1){
      return true;

    }else{
      return false;

    }
  }
  searchForDoctor(String doctorName) async {
    doctorsData =[];
  doctorsData = await DoctorServices.searchForDoctors(doctorName,specialistId);
  if(
  doctorsData?.length==0||doctorsData==[]
  ){
    searchHasNoResult = true;

  }else{
    searchHasNoResult =  false;
  }
  update();
}
}