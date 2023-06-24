// ignore_for_file: sized_box_for_whitespace

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../Utils/translation_key.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body:DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: CustomText('Tap back again to leave'),
        ),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.25,
                width: Get.width*0.5,
                child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
              ),
                Column(
                children: [
                  CustomText(welcomeText.tr,
                    style: const TextStyle(

                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),),
                  CustomText("${welcomeText1.tr} \n ${welcomeText2.tr}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                        fontFamily:fontFamilyName,
                        color: kBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),),
                  InkWell(
                    onTap: (){
                      Get.find<LocalizationService>().toggleLocale();

                      Get.offAll(const WelcomeScreen());
                    },
                    child:  CustomText(languageWelcomeBTN.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap:(){
                      Get.to(const LoginScreen());
                    },
                    child: Container(
                      height: 60,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBlueColor
                      ),
                      child:  Center(
                        child:  CustomText(welcomeBTN1.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const SignUpScreen());
                    },
                    child: Container(
                      height: 60,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBlueColor
                      ),
                      child:  Center(
                        child:  CustomText(welcomeBTN2.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),),
                      ),
                    ),
                  ),
                ],
              )),
              InkWell(
                onTap: (){
                  Get.to(()=>const HomeScreen());
                },
                child:  CustomText(skipToHomeBTN.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: fontFamilyName,
                      color: kBlueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
