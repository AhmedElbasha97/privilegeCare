// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';

class DoctorListController extends GetxController{
  bool isLoading = true;
  bool hasNoData = false;
  bool searchHasNoResult = false;
  late TextEditingController searchController;
  final ScrollController sController = ScrollController();
  List<DoctorListModel>? doctorsData =[];
  final String specialistId;

  DoctorListController(this.specialistId);
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
  if(doctorsData?.length == 0 || doctorsData == null){
    hasNoData = true;
  }
  isLoading = false;
  update();
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