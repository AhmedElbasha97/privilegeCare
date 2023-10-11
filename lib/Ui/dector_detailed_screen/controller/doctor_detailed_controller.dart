// ignore_for_file: prefer_is_empty, prefer_typing_uninitialized_variables

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
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class DoctorDetailedController extends GetxController{
  late DoctorProfile? doctorData;
  late  VideoPlayerController videoPlayerController;
  List<CommentModel>? comments = [];
  final ScrollController sController = ScrollController();
  bool isLoading = true;
  final String doctorId;
  bool commentHasNodData = false;
  bool doctorAddedOrNot = false;
  int screenIndex = 3;
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
    if(doctorData?.video != "0"){
      videoPlayerController =
       VideoPlayerController.network('${Services.baseUrl}${doctorData?.video??""}')
        ..initialize().then((_) {
          print("hi from video controller");
         update();
    });
            }
    if(comments?.length==0||comments==[]){
      commentHasNodData = true;
    }

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
      coords: Coords(double.parse(doctorData?.locationLat??"0.0"), double.parse(doctorData?.locationLon??"0.0")),
      title: " ${doctorLoc.tr} ${doctorData?.name}",
      description: " ${doctorLoc.tr} ${doctorData?.name}",
    );
  }
  goToScreen(){
    if(screenIndex == 1){
      Get.to(()=> const LoginScreen());
    }else if(screenIndex == 2){
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
        doctorAddedOrNot = await checkDoctorAddedOrNot(doctorId);
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
          content: CustomText("${addDocToFav1.tr} $doctorName ${addDocToFav2.tr}" ),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        doctorAddedOrNot = await checkDoctorAddedOrNot(doctorId);
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
  shareDoctorLink(){
    Share.share(doctorData?.profile??"");
  }
}