// ignore_for_file: sized_box_for_whitespace

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/changePassword/controller/change_password_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) => Scaffold(
appBar:  AppBar(
  backgroundColor: kGreenColor,
  leadingWidth: 60,
  leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
      Get.back();
  },),
  centerTitle: true,
  title:   CustomText(
    changePassScreenTitle.tr,
      style: const TextStyle(
          fontFamily: fontFamilyName,
          color: kWhiteColor,
          fontWeight: FontWeight.w800,
          fontSize: 18),
  ),

),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(changePassScreenText1.tr,

                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                          hasIntialValue: true,
                          textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,
                          labelText:  "**********************",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: false,
                          controller: controller.passwordController,
                          validator: controller.validatePassword,
                          isAutoValidate: true,
                          obsecure: !controller.visiblePsd,
                          icon: IconButton(
                            // Based on passwordVisible state choose the icon
                            icon: Icon(
                              controller.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGrayColor,
                            ),
                            onPressed: () {
                              controller.toggleVisiblePsd();
                            },
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(changePassScreenText2.tr,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                          hasIntialValue: true,
                          labelText:  "**********************",

                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: false,
                          textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,

                          controller: controller.reTypePasswordController,
                          validator: controller.validateReTypePassword,
                          isAutoValidate: true,
                          obsecure: !controller.visiblePsd,
                          icon: IconButton(
                            // Based on passwordVisible state choose the icon
                            icon: Icon(
                              controller.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGrayColor,
                            ),
                            onPressed: () {
                              controller.toggleVisiblePsd();
                            },
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  RichText(
                    text:   TextSpan(
                      children: [

                        const WidgetSpan(
                          child: Icon(Icons.info_sharp, size: 14,color: kBlueColor,),
                        ),
                        TextSpan(
                          text: changePassScreenText3.tr,
                          style:  const TextStyle(
                              fontSize: 12.0,
                              fontFamily: fontFamilyName,
                              fontWeight: FontWeight.w600,
                              color: kBlueColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      if(
                      controller.changePassword){
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.loading,
                        );
                      }else{
                        controller.sendPressed(context);
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: Get.width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:controller.changePassword?kGrayColor:kBlueColor
                        ),
                        child:  Center(
                          child:  CustomText(changePassScreenTitle.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: fontFamilyName,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}