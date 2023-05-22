import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctor_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';

class DoctorDetailedController extends GetxController{
  late DoctorProfile? doctorData;
  final ScrollController sController = ScrollController();
  bool isLoading = true;
  final String doctorId;

  DoctorDetailedController(this.doctorId);
  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
  getData() async {
    doctorData = await DoctorServices.getDoctorProfiles(doctorId);
    isLoading = false;
    update();
  }
}