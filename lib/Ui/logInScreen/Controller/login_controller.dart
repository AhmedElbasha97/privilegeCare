// ignore_for_file: prefer_final_fields

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:privilegecare/Models/auth_model.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/validator.dart';
const wrongCode = 'assets/images/wrong_code.png';

class LoginController extends GetxController {
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
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool emailState = false;
  bool passHasAnErrorViewed = false;
  bool emailHasAnErrorViewed = false;
  bool signingIn =false;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    checkForUpgrades();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    emailController.clear();
  }

  checkForUpgrades() {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // Perform immediate update
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
            }
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          //Perform flexible update
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    });
  }


  void onEmailUpdate(String? value) {
    if (value == "") {
      emailValidated = false;
    }
    update();
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


  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningIn(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }


  sinningIn(context) async {
    signingIn = true;
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
if(emailState){
  AuthModel? data = await AuthServices.logIn(emailController.text, passwordController.text);
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

  @override
  String toString() {
    return 'LoginController{ _email: ${emailController
        .value}, _password: ${passwordController.value}}';
  }
}