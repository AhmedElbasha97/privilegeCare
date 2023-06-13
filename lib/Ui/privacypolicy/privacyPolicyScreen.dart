// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/privacypolicy/controller/privacy_policy_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  PrivacyPolicyController(context),
      builder: (PrivacyPolicyController controller) =>
          Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
                Get.back();
              },),
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
                    child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.privacyData?.titleEn??"":controller.privacyData?.title??"",
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
                    data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.privacyData?.descEn??"":controller.privacyData?.desc??"",
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
