// ignore_for_file: prefer_is_empty, prefer_typing_uninitialized_variables

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/memory.dart';

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
  void onClose() {
    searchController.dispose();
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
          content: Text(' تم حذف الطبيب $doctorName من قائمة المفضله  '),

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
          .addOrRemoveDoctorFromFavorite(
          doctorId, Get
          .find<StorageService>()
          .getId, "1");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: Text(' تم اضاف الطبيب $doctorName الى قائمة المفضلة '),

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