// ignore_for_file: prefer_final_fields

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/auth_model.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/Utils/validator.dart';

class SignUpController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;


  RxBool _visiblePsd = false.obs;


  RxBool _isEnableLogin = false.obs;

  bool get isEnableLogin => _isEnableLogin.value;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;

    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;
  late TextEditingController reTypePasswordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool firstNameValidated = false;
  bool secondNameValidated = false;
  bool lastNameValidated = false;
  bool phoneValidated = false;
  bool reTypePasswordValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool reTypePasswordState = false;
  bool emailState = false;
  bool firstNameState = false;
  bool secondNameState = false;
  bool lastNameState = false;
  bool phoneState = false;
bool signingUp = false ;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();

    emailController = TextEditingController();

    reTypePasswordController = TextEditingController();

    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController =TextEditingController();



  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    reTypePasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    secondNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    reTypePasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    secondNameController.clear();
    phoneController.clear();
  }
  void onEmailUpdate(String? value) {
    if(value == "omar.khaled20@yahoo.com"){
      phoneController.clear();
    }
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

  String? validatePassword(String? password) {
    final validatePassword = _validatorHelber.validatePassword(password);
    if (validatePassword == null) {
      passState = true;

    }else{

    }
    passValidated = true;

    return validatePassword;
  }
  String? validateReTypePassword(String? password) {
    var validatePassword = _validatorHelber.validatePassword(password);
    if (validatePassword == null) {
      if(passwordController.text != "") {
        if (password == passwordController.text) {
          reTypePasswordState = true;
          reTypePasswordValidated = true;
        } else {
          validatePassword = invalidReTypePassword.tr;
        }
      }else{
        validatePassword = enterPasswordFirst.tr;
      }
    }else{
      reTypePasswordState = false;
      reTypePasswordValidated = false;
    }
    return validatePassword;
  }
  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningUp(context);
    }
  }
  Future<void> sendPressedFromDialogue(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningUpFromDialogue(context);
    }
  }
  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }

  sinningUp(context) async {
    signingUp = true;
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
    if(passState&&emailState&&firstNameState&&secondNameState&&lastNameState&&phoneState&&reTypePasswordState){
      AuthModel? data = await AuthServices.signUp("${firstNameController.text} ${secondNameController.text} ${lastNameController.text}",
      emailController.text,
        passwordController.text,
        reTypePasswordController.text
      );
      if(data?.msg == "succeeded"){
        await Get.find<StorageService>().saveAccountId("${data?.info?.id??0}");
        Get.off(SpecialtyScreen());
      }else{
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: data?.msg
        );
      }
    }
  }
  sinningUpFromDialogue(context) async {
    signingUp = true;
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
    if(passState&&emailState&&firstNameState&&secondNameState&&lastNameState&&phoneState&&reTypePasswordState){
      AuthModel? data = await AuthServices.signUp("${firstNameController.text} ${secondNameController.text} ${lastNameController.text}",
      emailController.text,
        passwordController.text,
        reTypePasswordController.text
      );
      if(data?.msg == "succeeded"){
        await Get.find<StorageService>().saveAccountId("${data?.info?.id??0}");
        Get.back();
      }else{
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: data?.msg
        );
      }
    }
  }

}