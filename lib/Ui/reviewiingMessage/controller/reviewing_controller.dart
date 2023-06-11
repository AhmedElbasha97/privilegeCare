import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/reviewing_services.dart';
import 'package:privilegecare/Ui/reviewiingMessage/widget/reviewing_success_widget.dart';
import 'package:privilegecare/Utils/memory.dart';

import '../../../Utils/localization_services.dart';
import '../../../Utils/translation_key.dart';

class ReviewingController extends GetxController{
  final TextEditingController msgController =  TextEditingController();
  double hospitalReview = 0.0;
  double doctorReview = 0.0;
  bool addingReview = false;
  final  int historyId;

  ReviewingController(this.historyId);
  changeHospitalReview(double hospReview){
    hospitalReview = hospReview;
    update();
  }
  changeDoctorReview(double docReview){
    doctorReview = docReview;
    update();
  }
addReview(context) async {
  addingReview = true;
  update();
  CoolAlert.show(
    context: context,
    type: CoolAlertType.loading,
  );

    ResponseModel? data = await ReviewingServices.addReviewToDoctor("$historyId", Get.find<StorageService>().getId, msgController.text, "$hospitalReview", "$doctorReview");
    if(data?.msg == "succeeded"){
      Get.back();
      showDialog(context: context,
        builder: (context) =>
            const ReviewingSuccessWidget(),
      );

    }else{
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: errorKey.tr,
          text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr,
      );
    }
}
}