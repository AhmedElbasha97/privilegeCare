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

class FilterController extends GetxController{
  String choosenSearchType = "D";
  String choosenDiscloseType = "0";
  String placeName = "";
  String placeId = "";
  String specialtyName = "";
  String specialtyId = "";
  String specialtyImageURl = "";
  String levelName = "";
  String levelId = "";
  String ratingName = "";
  String ratingId = "";
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
  List<RatingModel> ratingsListData = [RatingModel(title: "نجمة واحده واكثر",id: "1"),RatingModel(title: "نجمتين واحده واكثر",id: "2"),RatingModel(title:"ثلاث نجوم واكثر",id: "3"),RatingModel(title: "اربع نجوم واكثر",id: "4"),RatingModel(title: "خمس نجوم",id: "5")];
  int sVal =0;
  int sFal =0;
  RangeValues currentRangeValues = const RangeValues(0,100);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startPriceRange = TextEditingController();
    endPriceRange = TextEditingController();
    startPriceRange.text = "0";
    endPriceRange.text = "100";
    getData();
  }
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
    specialtyImageURl =  "https://privilegecare.net${chosenSpecialty.image}";
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
      endPriceRange.text = "100";
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
          content: Text(' تم حذف الطبيب ${doctorName} من قائمة المفضله  '),

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
          content: Text(' تم اضاف الطبيب ${doctorName} الى قائمة المفضلة '),

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
    var status = await FavouriteServices.getAddedOrNotToFavoritesDoctor(doctorId, "${Get.find<StorageService>().getId}");
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
    update();
    Get.to(()=>const AdvancedSearchScreen());
    }else{
     hospitalListData = await HospitalServices.advancedSearchForDoctorsWithArea(choosenSearchType, specialtyId, placeId, levelId, "$sVal", "$sFal", choosenDiscloseType);
     searchIsLoading = false;
     update();
     Get.to(()=>const AdvancedSearchScreen());
    }
  }
}