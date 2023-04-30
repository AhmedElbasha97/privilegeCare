import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/validator.dart';
const wrongCode = 'assets/images/wrong_code.png';

class LoginController extends GetxController {
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;
  int loggedInStatus = 0;

  RxBool _visiblePsd = false.obs;
  var groupValue = 3;
  var emailType = "";


  RxBool _isEnableLogin = false.obs;

  bool get isEnableLogin => _isEnableLogin.value;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;
    print('LoginController.isEnableSignup value= $value');
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

  onChooseCompanyType(int value) {
    loggedInStatus = 0;
    update();
    if (value == 0) {
      groupValue = value;
      emailType = "COMP";
      update();
    } else {
      groupValue = value;
      emailType = "EMP";
      update();
    }
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
      updateYourButton();
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
      updateYourButton();
    }
    passValidated = true;
    return validatePassword;
  }

  //for returning the button to its original state
  updateYourButton() {
    if (emailState && passState) {
      if (loggedInStatus != 0) {
        loggedInStatus = 0;
      }
    }
  }

  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningIn(context);
    } else {
      loggedInStatus = 3;
      update();
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


  }

  @override
  String toString() {
    return 'LoginController{ _email: ${emailController
        .value}, _password: ${passwordController.value}}';
  }
}