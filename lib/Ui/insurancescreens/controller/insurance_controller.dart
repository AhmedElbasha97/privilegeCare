import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/health_insurance_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/health_insirance_services.dart';
import 'package:privilegecare/Ui/insurancescreens/insurance_screen.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/validator.dart';

class InsuranceController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = true;
  bool hasNoData = false;
  bool companyNameValidated = false;
  bool editingInsuranceCard = false;
  bool formValidated = false;
  bool companyNameState = false;
  bool healthInsuranceNumberValidated = false;
  bool healthInsuranceNumberState = false;

  final formKey = GlobalKey<FormState>();
  late TextEditingController companyNameController;
  late TextEditingController healthInsuranceNumberController;

  HealthInsuranceModel? healthInsuranceData;
@override
  void onInit() {
    companyNameController = TextEditingController();
    healthInsuranceNumberController =TextEditingController();
    getData();
    super.onInit();
  }
  void onCompanyNameUpdate(String? value) {
    if (value == "") {
      companyNameState = false;
    }
    update();
  }void onHealthInsuranceNumberUpdate(String? value) {
    if (value == "") {
      healthInsuranceNumberState = false;
    }
    update();
  }
  String? validateCompanyName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      companyNameState = true;
      companyNameValidated = true;

    } else {
      companyNameValidated = true;
      companyNameState = false;
    }
    return validateName;
  }
  String? validateHealthInsuranceNumber(String? number) {
    var validateNumber = _validatorHelber.validateName(number);
    if (validateNumber == null && number != "") {
      healthInsuranceNumberState = true;
      healthInsuranceNumberValidated = true;

    } else {
      healthInsuranceNumberValidated = true;
      healthInsuranceNumberState = false;
    }
    return validateNumber;
  }
  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await editingHealthInsuranceData(context);
    }
  }
  editingHealthInsuranceData(context) async {
    editingInsuranceCard = true;
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
    );
    ResponseModel? data = await HealthInsuranceServices.setHealthInsurance(Get.find<StorageService>().getId, healthInsuranceNumberController.text, companyNameController.text);
    if(data?.msg == "succeeded"){

  Get.to(()=>const InsuranceScreen());
    }else{
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "حدث خطأ",
          text: data?.msg
      );
    }
  }
  getData() async {
  healthInsuranceData = await HealthInsuranceServices.getHealthInsuranceData(Get
      .find<StorageService>()
      .getId);
  if(healthInsuranceData?.insurance == null||healthInsuranceData?.insurance == ""){
    hasNoData = true;
  }
  isLoading = false;
  update();
  }
}