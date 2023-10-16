// ignore_for_file: prefer_is_empty, prefer_typing_uninitialized_variables

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class FavoriteDoctorsController extends GetxController{
  bool isLoading = true;
  bool hasNoData = false;
  List<DoctorListModel>? doctorsData = [];
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<FavoriteDoctorsController>();
  }
  getData() async {
    isLoading = true;
    update();
    doctorsData = await DoctorServices.getDoctorsInThisFavoriteList();
    if (doctorsData?.length == 0 || doctorsData == null) {
      hasNoData = true;
    }
    isLoading = false;
    update();
  }
  addingOrRemovingFromFavorite(String doctorId,context,String doctorName,DoctorListModel index) async {

      ResponseModel? status = await FavouriteServices
          .addOrRemoveHospitalFromFavorite(
          doctorId, Get
          .find<StorageService>()
          .getId, "0");

          doctorsData?.remove(index);
          if(doctorsData?.length == 0){
            hasNoData = true;
            update();
          }
          update();
      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: CustomText(' ${removeDocFromFav1.tr} $doctorName ${removeDocFromFav2.tr}  '),

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

