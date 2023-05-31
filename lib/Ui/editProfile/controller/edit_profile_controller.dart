
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/profile_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Ui/profileScreen/profile_screeen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/validator.dart';

class EditProfileController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;
  late ProfileModel? data;
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;
  late TextEditingController reTypePasswordController;
  late TextEditingController emailController;
  bool firstNameValidated = false;
  bool secondNameValidated = false;
  bool lastNameValidated = false;
  bool phoneValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool emailState = false;
  bool firstNameState = false;
  bool secondNameState = false;
  bool lastNameState = false;
  bool phoneState = false;
  bool editProfile = false ;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController =TextEditingController();
    getData();
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    secondNameController.dispose();
    phoneController.dispose();

    super.onClose();
  }

  void clear() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    secondNameController.clear();
    phoneController.clear();
  }
  
  getData() async {
    data = await AuthServices.getUserData( Get.find<StorageService>().getId);
    List<String>? words = data?.name?.split(" ");
    firstNameController.text = words?[0]??"";
    if(words!.length > 1){
      secondNameController.text = words[1];
    }
    if(words.length > 2){
      lastNameController.text = words[2];
    }
    phoneController.text = "${data?.phone??0}";
    emailController.text = data?.email??"";
    isLoading = false;
    update();
  }
  
  void onEmailUpdate(String? value) {

    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  void onFirstNameUpdate(String? value) {
    if (value == "") {
      firstNameState = false;
    }
    update();
  }
  String? validateFirstName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      firstNameState = true;
      firstNameValidated = true;

    } else {
      firstNameValidated = true;
      firstNameState = false;
    }
    return validateName;
  }
  void onSecondNameUpdate(String? value) {
    if (value == "") {
      secondNameState = false;
    }
    update();
  }
  String? validateSecondName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {

      secondNameState = true;
      secondNameValidated = true;
    } else {
      secondNameValidated = true;
      secondNameState = false;
    }
    return validateName;
  } void onLastNameUpdate(String? value) {
    if (value == "") {
      lastNameState = false;
    }
    update();
  }
  String? validateLastName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      lastNameState = true;
      lastNameValidated = true;
    } else {
      lastNameValidated = true;
      lastNameState = false;
    }
    return validateName;
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
  String? validateEmail(String? email) {
    final validateEmail = _validatorHelber.validateEmail(email);
    if (email == "") {
      emailState = false;
      emailValidated = false;

    } else if (validateEmail == null) {
      emailState = true;
      emailValidated = true;


    } else {
      emailValidated = true;
      emailState = false;
    }

    return validateEmail;
  }

  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningUp(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }
  bool checkDataHasBeenChanged(){
    List<String>? words = data?.name?.split(" ");
    bool firstChecker = false;
    bool secondChecker = false;
    bool thirdChecker = false;
    bool forthChecker = false;
    bool fifthChecker = false;
    if(firstNameController.text == words![0]){
      firstChecker = true;
    }

    if(words.length > 1){
      if(secondNameController.text == words[1]){
        secondChecker = true;
      }
    }else{
      if(secondNameController.text == ""){
        secondChecker = true;
      }
    }
    if(words.length > 2){
      if(lastNameController.text == words[2]){
        thirdChecker = true;
      }
    }else{
      if(lastNameController.text == ""){
        thirdChecker = true;
      }
    }
    if(phoneController.text == "${data?.phone??0}"){
     forthChecker = true;
    }
    if(emailController.text == data!.email){
      fifthChecker = true;
    }
    if(firstChecker&&secondChecker&&thirdChecker&&forthChecker&&fifthChecker){
      return true;
    }
    return false ;
  }
  sinningUp(context) async {
    editProfile = true;
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
    if(checkDataHasBeenChanged()){
    if(emailState&&firstNameState&&secondNameState&&lastNameState&&phoneState){
      ResponseModel? data = await AuthServices.editAccountData(
         Get.find<StorageService>().getId,
        "${firstNameController.text} ${secondNameController.text} ${lastNameController.text}",
          emailController.text,
          "974${phoneController.text}",

      );
      if(data?.msg == "succeeded"){

        Get.off(const ProfileScreen());
      }else{
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",
        );
      }
    }
    }
  }

}