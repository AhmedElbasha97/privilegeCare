
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/Ui/term&condition/controller/term_and_condition_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  TermsAndConditionController(context),
      builder: (TermsAndConditionController controller) =>
          Scaffold(
        appBar: AppBar(
          iconTheme:  const IconThemeData(color: Colors.white),
          backgroundColor:kGreenColor ,

        ),
        body: controller.loading
            ? const Loader()
            : ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.termsData?.titleEn??"":controller.termsData?.title??"",
                  style: const TextStyle(
                      fontFamily: fontFamilyName,

                      color: kBlueColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.termsData?.descEn??"":controller.termsData?.desc??"",
                style: {
                  "body": Style(
                    fontFamily: fontFamilyName,
                    color: kGreenColor,
                    fontWeight: FontWeight.w800,
                    fontSize: FontSize(20),
                  ),
                },),
            )
          ],
        ),
      ),
    );
  }
}
