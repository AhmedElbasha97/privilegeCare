import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class FavoriteDoctorsController extends GetxController{
  bool isLoading = true;
  bool hasNoData = false;
  List<DoctorListModel>? doctorsData = [];
  @override
  void onInit() {
    super.onInit();
    getData();
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
          .addOrRemoveDoctorFromFavorite(
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
    }
    }

