
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Services/app_info_services.dart';

class TermsAndConditionController extends GetxController{
  late PrivacyPolicy? termsData;
  bool loading = true;
  bool isOffline = false;

  final BuildContext context;
  @override
  TermsAndConditionController(this.context);
  @override
  Future<void> onInit() async {

    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<TermsAndConditionController>();
  }
  getData() async {
    termsData = await AppInfoServices().getTermsAndCondition();
    loading = false;
    update();
  }
}