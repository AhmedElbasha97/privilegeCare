// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/government_model.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/levels_model.dart';
import 'package:privilegecare/Models/rating_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Services/government_services.dart';
import 'package:privilegecare/Services/hospital_services.dart';
import 'package:privilegecare/Services/specialist_services.dart';
import 'package:privilegecare/Ui/filter/advanced_search_screen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';

import '../../../Utils/translation_key.dart';
import '../../../widgets/custom_text_widget.dart';

class FilterController extends GetxController{
  String choosenSearchType = "D";
  String choosenDiscloseType = "0";
  String placeName = "";
  String placeId = "0";
  String specialtyName = "";
  String specialtyId = "0";
  String specialtyImageURl = "";
  String levelName = "";
  String levelId = "0";
  String ratingName = "";
  String ratingId = "0";
  bool isLoading = true;
  bool searchIsLoading = true;
  bool hasNoData = false;
  final ScrollController sController = ScrollController();
  late TextEditingController startPriceRange;
  late TextEditingController endPriceRange;
  List<GovernmentModel>? governmentData = [];
  List<SpecialistModel>? specialtyListData = [];
  List<LevelModel>? levelListData = [];
  List<HospitalListModel>? hospitalListData = [];
  List<DoctorListModel>? doctorsData = [];
  List<RatingModel> ratingsListData = [RatingModel(title: oneStarRat.tr,id: "1"),RatingModel(title: twoStarRat.tr,id: "2"),RatingModel(title:threeStarRat.tr,id: "3"),RatingModel(title: fourStarRat.tr,id: "4"),RatingModel(title: fiveStarRat.tr,id: "5")];
  int sVal =0;
  int sFal =0;
  RangeValues currentRangeValues = const RangeValues(0,1000);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startPriceRange = TextEditingController();
    endPriceRange = TextEditingController();
    startPriceRange.text = "0";
    endPriceRange.text = "1000";
    getData();
  }
  @override


  getData() async{
    governmentData = await GovernmentServices.getGovernments();
    specialtyListData = await SpecialistServices.getAllSpecialist();
    levelListData = await DoctorServices.getLevelsData();
    isLoading = false;
    update();
  }
  choosingPlace(GovernmentModel chosenGovernment){
    placeName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?chosenGovernment.nameEn:chosenGovernment.name)!;
    placeId = "${chosenGovernment.id}";
    update();
  }
  choosingLevel(LevelModel chosenLevel){
    levelName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?chosenLevel.nameEn:chosenLevel.name)!;
    levelId = "${chosenLevel.id}";
    update();
  }
  choosingRating(RatingModel chosenRating){
    ratingName = chosenRating.title??"";
    ratingId = chosenRating.id??"";
    update();
  }
  choosingSpecialty(SpecialistModel chosenSpecialty){
    specialtyName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?chosenSpecialty.nameEn:chosenSpecialty.name)!;
    specialtyId = "${chosenSpecialty.id}";
    specialtyImageURl =  "${Services.baseUrl}${chosenSpecialty.image}";
    update();
  }
  changeStartPrice(String value){
    if(double.parse(value) <= sFal && double.parse(value) >= 0 ) {
      startPriceRange.text = value;
      currentRangeValues = RangeValues(double.parse(value), sFal.toDouble());
      update();
    }else{
      startPriceRange.text = "0";
    }
  }
  changeEndPrice(String value){
    if(double.parse(value) <= 100 && double.parse(value) >= sVal.toDouble()) {
      endPriceRange.text = value;
      currentRangeValues = RangeValues(sVal.toDouble(), double.parse(value));
      update();
    }else{
      endPriceRange.text = "1000";
    }
  }
  addingOrRemovingFromFavorite(String objectId,context,String objectName) async {
    if(choosenSearchType == "D"){
    if (await checkAddedOrNotToFavorite(objectId)) {
      ResponseModel? status = await FavouriteServices
          .addOrRemoveDoctorFromFavorite(
          objectId, Get
          .find<StorageService>()
          .getId, "0");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: CustomText(' ${removeDocFromFav1.tr} $objectName ${removeDocFromFav2.tr}  '),

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
    else {
      ResponseModel? status = await FavouriteServices
          .addOrRemoveDoctorFromFavorite(
          objectId, Get
          .find<StorageService>()
          .getId, "1");

      if (status?.msg == "succeeded") {
        final snackBar = SnackBar(
          content: CustomText(' ${addDocToFav1.tr} $objectName ${addDocToFav2.tr} '),

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
      }}

    }else{
      if (await checkAddedOrNotToFavorite(objectId)) {
        ResponseModel? status = await FavouriteServices
            .addOrRemoveHospitalFromFavorite(
            objectId, Get
            .find<StorageService>()
            .getId, "0");

        if (status?.msg == "succeeded") {
          final snackBar = SnackBar(
            content: CustomText(' ${removeHospToFavText1.tr} $objectName ${removeHospToFavText2.tr}  '),

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
      else {
        ResponseModel? status = await FavouriteServices
            .addOrRemoveHospitalFromFavorite(
            objectId, Get
            .find<StorageService>()
            .getId, "1");

        if (status?.msg == "succeeded") {
          final snackBar = SnackBar(
            content: CustomText(' ${addHospToFavText1.tr} $objectName ${addHospToFavText2.tr} '),

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
        }}
    }
  }

  Future<bool> checkAddedOrNotToFavorite(String objectId) async {
    var status = choosenSearchType == "D"?await FavouriteServices.getAddedOrNotToFavoritesDoctor(objectId, Get.find<StorageService>().getId):
    FavouriteServices.getAddedOrNotToFavoritesHospital(objectId, Get.find<StorageService>().getId);
    if(status == 1){
      return true;

    }else{
      return false;

    }
  }
  choosingPriceRange(RangeValues value){
      sVal = value.start.round();
      sFal = value.end.round();
      startPriceRange.text = "${value.start.round()}";
      endPriceRange.text = "${value.end.round()}";
      currentRangeValues = value;
      update();

  }
  choosingSearchType(String searchType){
    choosenSearchType = searchType;
    update();
  }
  choosingSearchDisclose(String discloseType){
    choosenDiscloseType = discloseType;
    update();
  }
  startSearching() async {
    if(choosenSearchType == "D"){
      doctorsData = await DoctorServices.advancedSearchForDoctorsWithArea(choosenSearchType, specialtyId, placeId, levelId, "$sVal", "$sFal", choosenDiscloseType);
    searchIsLoading = false;
    if(doctorsData?.length == 0||doctorsData == []){
      hasNoData = true;
    }
    update();
    Get.to(()=>const AdvancedSearchScreen());
    }else{
     hospitalListData = await HospitalServices.advancedSearchForDoctorsWithArea(choosenSearchType, specialtyId, placeId,);
     searchIsLoading = false;
     if(hospitalListData?.length == 0||hospitalListData == []){
       hasNoData = true;
     }
     update();
     Get.to(()=>const AdvancedSearchScreen());
    }
  }
}