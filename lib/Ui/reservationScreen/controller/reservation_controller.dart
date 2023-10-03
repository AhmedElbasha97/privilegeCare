// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_is_empty

import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctor_reservation_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Services/reservation_services.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/second_reservation_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/widget/reservation_success_widget.dart';
import 'package:privilegecare/Ui/reservationScreen/widget/reservation_to_non_regestier_user_wiget.dart';
import 'package:privilegecare/Ui/reservationScreen/widget/sign_up_dialogue.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/validator.dart';

import '../../../Utils/translation_key.dart';

class ReservationController extends GetxController{
  final formKey = GlobalKey<FormState>();

  final _validatorHelber = ValidatorHelper.instance;
 late DoctorReservationData? doctorData;
  bool decideToSignIn = false;
  String dateText = "xx/xx/xxxx";
  String address = "";
  String timeText = "--:-";
  String selectedTime = "";
  int choosenGender = 3;
  String scheduleId = "";
  FilePickerResult? pickedFile;
  String choosenFileIndex = "0";
  List<String>? appointments = [];
  int reservationFroAnotherPatient = 0;
  bool isLoading = true;
  bool enableChooseTime = false;
  bool nameValidated = false;
  bool nameState = false;
  bool phoneValidated = false;
  bool phoneState = false;
  bool formValidated = false;
  bool reservationIsRunning = false;
  final String doctorId;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController nameWidgetController;
  late TextEditingController phoneWidgetController;
  bool continueWithoutAccount = false;

  ReservationController(this.doctorId);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    nameWidgetController = TextEditingController();
    phoneWidgetController = TextEditingController();
    getData();
  }
  Future<void> _getAddressFromLatLng(double lat,double long) async {
    await placemarkFromCoordinates(lat,long)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

        address =
        "${place.street},${place.subAdministrativeArea},${place.subLocality},${place.country}"
        ;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getData() async {
    doctorData = await DoctorServices.getDoctorReservationData(doctorId);
    _getAddressFromLatLng(double.parse(doctorData?.locationLat??""),double.parse(doctorData?.locationLon??""));
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
  void onPhoneNumberUpdate(String? value) {
    if (value == "") {
      phoneState = false;
    }
    update();
  }

  String? validatePhoneNumber(String? phoneNumber) {

    var validateName = _validatorHelber.validatePhoneNumberField(phoneNumber);
    if (validateName == null && phoneNumber != "") {
      phoneState = true;
      phoneValidated = true;

    } else {
      phoneValidated = true;
      phoneState = false;
    }
    return validateName;
  }
  void onNameUpdate(String? value) {
    if (value == "") {
      nameState = false;
    }
    update();
  }
  String? validateName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      nameState = true;
      nameValidated = true;

    } else {
      nameValidated = true;
      nameState = false;
    }
    return validateName;
  }
  gotoAnotherReservationScreen(context){
    if(dateText == "xx/xx/xxxx"){
      CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: warningKey.tr,
          text: mustChooseReservationDate.tr
      );
    }else if(timeText == "--:-"){
      CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: warningKey.tr,
          text: mustChooseReservationTime.tr
      );
    }else{
      Get.to(() =>  SecondReservationScreen(doctorId: doctorId,));
    }
  }
selectingTime(String time,context){
  timeText = changeTimeToAmPmFormat(time,context);
  selectedTime = time;

  update();
}
choosingDate(String scheduleId,String date) async {
  enableChooseTime = false;
  dateText = date;
  this.scheduleId = scheduleId;
  update();
  timeText = "--:-";
  appointments = await DoctorServices.getAppointment(scheduleId);
  if(appointments?.length == 0){
    timeText = noTimeAvailable.tr;
  }
  enableChooseTime = true;
  update();
}

  changeTimeToAmPmFormat(String? time,context){
    TimeOfDay _startTime = TimeOfDay(hour:int.parse(time!.split(":")[0]),minute: int.parse(time.split(":")[1]));
    return  _startTime.format(context);
  }

  signingUp(context){
    showDialog(context: context,
      builder: (context) =>
       const SignUpDialogue(),
    );

  }
  continuingWithoutAccount(context){

    showDialog(context: context,
      builder: (context) =>
        ReservationToNonRegestierUserWidget(doctorId: doctorId,),
    );

  }
  void pickFile() async {
    final result = await  FilePicker.platform.pickFiles(allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result == null) return;

    pickedFile = result;
    print(pickedFile?.count??0);
    choosenFileIndex = "1";
    update();
  }
  Future<void> sendPressedFromDialogue(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      addWidgetReservation(context);
    }
  }
  addReservation(context) async {
    if(Get.find<StorageService>().checkUserIsSignedIn || reservationFroAnotherPatient == 1){
     if(nameController.text == ""){
       if(phoneController.text == ""){
         reservationIsRunning = true;
         update();
         ResponseModel? data = await ReservationServices.saveAppointment(scheduleId, Get.find<StorageService>().getId, phoneController.text, selectedTime, nameController.text, " ", "$reservationFroAnotherPatient");
         if(data?.msg == "succeeded"){
           showDialog(context: context,
             builder: (context) =>
                 ReservationSuccessWidget(doctorName: Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.name??"":doctorData?.nameEn??"",),
           ).then((value){
             Get.off(SpecialtyScreen());
           });

         }else {
           CoolAlert.show(
               context: context,
               type: CoolAlertType.error,
               title: errorKey.tr,
               text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
           );
         }
       }else{
         CoolAlert.show(
           context: context,
           type: CoolAlertType.warning,
           title: warningKey.tr,
           titleTextStyle: const TextStyle(
               fontFamily: fontFamilyName,
               color: kBlueColor,
               fontWeight: FontWeight.w800,
               fontSize: 15),
           text: patientPhoneWarning.tr,
           textTextStyle: const TextStyle(
               fontFamily: fontFamilyName,
               color: kBlueColor,
               fontWeight: FontWeight.w800,
               fontSize: 15),
         );
       }
     }else{
       CoolAlert.show(
           context: context,
           type: CoolAlertType.warning,
           title: warningKey.tr,
           titleTextStyle: const TextStyle(
           fontFamily: fontFamilyName,
           color: kBlueColor,
           fontWeight: FontWeight.w800,
           fontSize: 15),
           text: patientNameWarning.tr,
           textTextStyle: const TextStyle(
           fontFamily: fontFamilyName,
           color: kBlueColor,
           fontWeight: FontWeight.w800,
           fontSize: 15),
       );
     }

    }else{
      decideToSignIn = false;
      continueWithoutAccount = false;
      CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        title: "",
        text: losePointWarning.tr,
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
        },
        confirmBtnText: goToReg.tr,
        cancelBtnText: contWithoutAcc.tr,
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
        if(continueWithoutAccount){
          continuingWithoutAccount(context);
        }

      });


    }
  }
  addWidgetReservation(context) async {

      reservationIsRunning = true;
      update();
      ResponseModel? data = await ReservationServices.saveAppointment(scheduleId, "0", phoneWidgetController.text, selectedTime, nameWidgetController.text, "aliiiii", "$reservationFroAnotherPatient");
      if(data?.msg == "succeeded"){
        showDialog(context: context,
          builder: (context) =>
              ReservationSuccessWidget(doctorName: Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.name??"":doctorData?.nameEn??"",),
        ).then((value){
          Get.off(SpecialtyScreen());
        });
      }else {
        reservationIsRunning = false;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: errorKey.tr,
            text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
        );
      }

  }

}