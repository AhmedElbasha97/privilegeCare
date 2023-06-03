// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty

import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/hospital_detailed_model.dart';
import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Services/hospital_services.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:share_plus/share_plus.dart';

class HospitalDetailedController extends GetxController{
bool isLoading = true;
int currentIndex = 0;
int currentActivePage = 0;
bool doctorHasNoData = false;
late PrivacyPolicy? xrayData;late PrivacyPolicy? lapData;
final ScrollController sController = ScrollController();
CarouselController cController = CarouselController();
late HospitalDetailedModel? hospitalData;
bool hospitalAddedOrNot = false;
int screenIndex = 3;
final String hospitalId;
List<DoctorListModel>? doctorsData = [];

  HospitalDetailedController(this.hospitalId);
@override
void onInit() {
  getData();
  // TODO: implement onInit
  super.onInit();
}
getData() async {
  doctorsData =  await HospitalServices.getDoctorsInThisHospital(hospitalId);
  hospitalData = await HospitalServices.getHospitalProfile(hospitalId);
  lapData = await HospitalServices.getLapData(hospitalId);
  xrayData = await HospitalServices.getXRayData(hospitalId);
  hospitalAddedOrNot = await checkHospitalAddedOrNot(hospitalId);

  if(doctorsData == []||doctorsData?.length==0){
    doctorHasNoData = true;
  }
  isLoading = false;
  update();
}
selectingPage(int index){

  currentIndex = index;
  update();
}
selectPage(int index){
  cController.jumpToPage(index);
  update();
}
selectingCategory(int index){
  currentActivePage = index;
  update();
}
showHospitalLocation() async {
  await MapLauncher.showMarker(
    mapType: Platform.isAndroid
        ?MapType.google:MapType.apple,
    coords: Coords(double.parse(hospitalData?.locationLat??"0.0"), double.parse(hospitalData?.locationLon??"0.0")),
    title: " موقع المستشفى ${hospitalData?.name}",
    description: " موقع المستشفى ${hospitalData?.name}",
  );
}
callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
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
      hospitalAddedOrNot = await checkHospitalAddedOrNot(hospitalId);
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
        .addOrRemoveHospitalFromFavorite(
        hospitalId, Get
        .find<StorageService>()
        .getId, "1");
    if (status?.msg == "succeeded") {
      final snackBar = SnackBar(
        content: Text(' تم اضاف المستشفى $hospitalName الى قائمة المفضلة '),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      hospitalAddedOrNot = await checkHospitalAddedOrNot(hospitalId);
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

Future<bool> checkHospitalAddedOrNot(String hospitalId) async {
  var status = await FavouriteServices.getAddedOrNotToFavoritesHospital(hospitalId, Get.find<StorageService>().getId);

  if(status == 1){
    return true;


  }else{
    return false;

  }
}
shareDoctorLink(){
  Share.share(hospitalData?.profile??"");
}
}