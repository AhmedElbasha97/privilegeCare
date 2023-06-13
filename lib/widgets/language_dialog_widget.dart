// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/profileScreen/profile_screeen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  StreamController<String> controller = StreamController<String>.broadcast();
  StreamController<String> controller1 = StreamController<String>.broadcast();
  StreamController<String> controller3 = StreamController<String>.broadcast();
  int groupValue =
      Get.find<StorageService>().activeLocale.languageCode == 'ar' ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    title: StreamBuilder(
                      stream: controller1.stream,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<String> snapshot,
                      ) {
                        return  CustomText(snapshot.hasData ? snapshot.data! :languageDialogueAR.tr,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),);
                      },
                    ),
                    value: 0,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: StreamBuilder(
                      stream: controller.stream,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<String> snapshot,
                      ) {
                        return CustomText(snapshot.hasData ? snapshot.data! :languageDialogueEN.tr,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),);
                      },
                    ),
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = 1;
                      });
                    },
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Get.find<LocalizationService>().toggleLocale();
                controller.add(languageDialogueEN.tr);
                controller1.add(languageDialogueAR.tr);
                controller3.add(languageDialogueCL.tr);
                Get.offAll(const ProfileScreen());
              },
              child: Container(
                width: Get.width*0.4,
                height: Get.height*0.04,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child:  Center(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.language,color: kWhiteColor,),
                      CustomText(languageDialogueBTN.tr,
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
