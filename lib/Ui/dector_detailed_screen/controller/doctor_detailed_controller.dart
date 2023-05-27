import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:privilegecare/Models/comment_model.dart';
import 'package:privilegecare/Models/doctor_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Services/reviewing_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:share_plus/share_plus.dart';

class DoctorDetailedController extends GetxController{
  late DoctorProfile? doctorData;
  List<CommentModel>? comments = [];
  final ScrollController sController = ScrollController();
  bool isLoading = true;
  final String doctorId;
  bool doctorAddedOrNot = false;
  DoctorDetailedController(this.doctorId);
  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
  getData() async {
    doctorData = await DoctorServices.getDoctorProfiles(doctorId);
    doctorAddedOrNot = await checkDoctorAddedOrNot(doctorId);
    comments = await ReviewingServices.getDoctorsInThisSpecialist(doctorId);
    isLoading = false;
    update();
  }
  callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }
  showDoctorLocation() async {
    await MapLauncher.showMarker(
      mapType: Platform.isAndroid
          ?MapType.google:MapType.apple,
      coords: Coords(double.parse(doctorData?.locationLon??"0.0"), double.parse(doctorData?.locationLat??"0.0")),
      title: " موقع الدكتور ${doctorData?.name}",
      description: " موقع الدكتور ${doctorData?.name}",
    );
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
          content: Text(' تم حذف الطبيب ${doctorName} من قائمة المفضله  '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        doctorAddedOrNot = await checkDoctorAddedOrNot(doctorId);
        update();
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
          doctorId, "${Get
          .find<StorageService>()
          .getId}", "1");
      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: Text(' تم اضاف الطبيب ${doctorName} الى قائمة المفضلة '),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        doctorAddedOrNot = await checkDoctorAddedOrNot(doctorId);
        update();
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
    var status = await FavouriteServices.getAddedOrNotToFavoritesDoctor(doctorId, "${Get.find<StorageService>().getId}");
    if(status == 1){
      return true;

    }else{
      return false;

    }
  }
  shareDoctorLink(){
    Share.share(doctorData?.profile??"");
  }
}