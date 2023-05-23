// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_is_empty

import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctor_reservation_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/reservation_services.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/second_reservation_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/widget/sign_up_dialogue.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/memory.dart';

class ReservationController extends GetxController{

 late DoctorReservationData? doctorData;
  bool decideToSignIn = false;
  String dateText = "xx/xx/xxxx";
  String timeText = "--:-";
  String periodText = "--";
  int choosenGender = 3;
  String scheduleId = "";
  FilePickerResult? pickedFile;
  String choosenFileIndex = "0";
  List<String>? appointments = [];
  int reservationFroAnotherPatient = 0;
  bool isLoading = true;
  bool enableChooseTime = false;
  final String doctorId;
  late TextEditingController nameController;
  bool continueWithoutAccount = false;
  late TextEditingController phoneController;
  ReservationController(this.doctorId);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
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
  gotoAnotherReservationScreen(context){
    if(dateText == "xx/xx/xxxx"){
      CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: "تحذير",
          text: "يجب عليك اختيار تاريخ الحجز"
      );
    }else if(timeText == "--:-"){
      CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: "تحذير",
          text: "يجب عليك ميعاد اختيار ميعاد الحجز"
      );
    }else{
      Get.to(() =>  SecondReservationScreen(doctorId: doctorId,));
    }
  }
selectingTime(String time,context){
  timeText = changeTimeToAmPmFormat(time,context);
  update();
}
choosingDate(String scheduleId,String date) async {
  enableChooseTime = false;
  dateText = date;
  this.scheduleId = scheduleId;
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

  signingUp(context){
print("hiiiii from showing dialogue");
    showDialog(context: context,
      builder: (context) =>
       const SignUpDialogue(),
    );

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

  addReservation(context) async {
    if(Get.find<StorageService>().checkUserIsSignedIn || reservationFroAnotherPatient == 1){
      ResponseModel? data = await ReservationServices.saveAppointment(scheduleId, "${Get.find<StorageService>().getId}", phoneController.text, timeText, nameController.text, "", "$reservationFroAnotherPatient", "");
      if(data?.msg == "succeeded"){

        Get.off(SpecialtyScreen());
      }else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: data?.msg
        );
      }
    }else{
      decideToSignIn = false;
      CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        title: "",
        text: 'سوف تخسر النقاط المكتسبه فى حاله لم تسجل دخولك أو لم تنشاء حساب',
        textTextStyle: const TextStyle(
            fontFamily: fontFamilyName,
            color: kBlueColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),
        onConfirmBtnTap: (){
          decideToSignIn = true;
        },
        onCancelBtnTap:(){
          continueWithoutAccount = true;
          addReservation(context);
          update();
        },
        confirmBtnText: 'الذهاب لتسجيل ',
        cancelBtnText: ' الأستكمال دون حساب ',
        confirmBtnColor: kGreenColor,
        cancelBtnTextStyle:   const TextStyle(
            fontFamily: fontFamilyName,
            color: kBlueColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),
        confirmBtnTextStyle: const TextStyle(
            fontFamily: fontFamilyName,
            color: kWhiteColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),


      ).then((value) {
        if(decideToSignIn){
          signingUp(context);
        }
      });


    }
  }

}