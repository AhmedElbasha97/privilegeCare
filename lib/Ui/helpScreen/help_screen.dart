

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/helpScreen/controller/help_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/loader.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  HelpController(),
      builder: (HelpController controller) =>
          Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
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
                    child: Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.helpData?.titleEn??"":controller.helpData?.title??"",
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
                    data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.helpData?.descEn??"":controller.helpData?.desc??"",
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