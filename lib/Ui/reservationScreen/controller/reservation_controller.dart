// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_is_empty

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctor_reservation_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';

class ReservationController extends GetxController{

 late DoctorReservationData? doctorData;

  String dateText = "xx/xx/xxxx";
  String timeText = "--:-";
  String periodText = "--";
  int choosenGender = 3;
  FilePickerResult? pickedFile;
  String choosenFileIndex = "0";
  List<String>? appointments = [];
  int reservationFroAnotherPatient = 0;
  bool isLoading = true;
  bool enableChooseTime = false;
  final String doctorId;

  ReservationController(this.doctorId);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  getData() async {
    doctorData = await DoctorServices.getDoctorReservationData(doctorId);
    isLoading = false;
    update();
  }

  choosingGender(int genderIndex){
    choosenGender = genderIndex;
    update();
  }
  makeReservationForAnotherPatient(){
    if(reservationFroAnotherPatient == 0){
      reservationFroAnotherPatient = 1;
      update();
    }else{
      reservationFroAnotherPatient = 0;
      update();
    }
  }
selectingTime(String time,context){
  timeText = changeTimeToAmPmFormat(time,context);
  update();
}
choosingDate(String scheduleId,String date) async {
  enableChooseTime = false;
  dateText = date;
  update();

  appointments = await DoctorServices.getAppointment(scheduleId);
  if(appointments?.length == 0){
    timeText = "ليس هناك ميعاد متاح فى هذا التاريخ";
  }
  enableChooseTime = true;
  update();
}

  changeTimeToAmPmFormat(String? time,context){
    TimeOfDay _startTime = TimeOfDay(hour:int.parse(time!.split(":")[0]),minute: int.parse(time.split(":")[1]));
    return  _startTime.format(context);
  }

  void pickFile() async {
    final result = await  FilePicker.platform.pickFiles(allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) return;
    pickedFile = result;
    choosenFileIndex = "1";
    update();
  }

}