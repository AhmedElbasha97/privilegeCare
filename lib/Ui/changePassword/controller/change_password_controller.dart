// ignore_for_file: prefer_final_fields

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Ui/profileScreen/profile_screeen.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/Utils/validator.dart';

class ChangePasswordController extends GetxController{
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
  late TextEditingController reTypePasswordController;
  bool passValidated = false;
  bool reTypePasswordValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool reTypePasswordState = false;
  bool changePassword = false ;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    reTypePasswordController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
    reTypePasswordController.dispose();

    super.onClose();
  }

  void clear() {
    passwordController.clear();
    reTypePasswordController.clear();

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
      await changingPassword(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }

  changingPassword(context) async {
    changePassword = true;
    update();
    ResponseModel? data = await AuthServices.changePassword(Get
        .find<StorageService>()
        .getId,passwordController.text);
    if(data?.msg == "succeeded"){
      Get.off(const ProfileScreen());
    }else {
      changePassword = false;
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: errorKey.tr,
          text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
      );
    }
  }


}
