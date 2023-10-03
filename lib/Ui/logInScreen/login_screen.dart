// ignore_for_file: sized_box_for_whitespace

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/forgetPassword/forget_password_screen.dart';
import 'package:privilegecare/Ui/logInScreen/Controller/login_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

import '../../Utils/translation_key.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) =>  Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kGreenColor,
          actions:  [
            TextButton(onPressed: (){
              Get.to(() => const HomeScreen());
            }, child:  CustomText(
              skipToHomeBTN.tr,
       style: const TextStyle(
        fontSize: 10.0,
        fontFamily: fontFamilyName,
        color: kWhiteColor,
      ),
            )),
          ],
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:   CustomText(
            signInTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height*0.8,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                SizedBox(
                  height: Get.height*0.13,
                  width: Get.width*0.5,
                  child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
                ),
                Container(
                  height: Get.height*0.6,
                  width: Get.width*0.8,
                  decoration: BoxDecoration(
                    color: kLightGrayColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child:Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        CustomText(signInText1.tr,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),),
                        CustomText(signInText2.tr,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 80,
                            child: CustomInputField(
                              textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,

                              hasIntialValue: false,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                              onchange: controller.onEmailUpdate,
                              validator: controller.validateEmail,
                              icon: (controller.emailValidated)
                                  ? (controller.emailState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kGreenColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : const SizedBox(width: 10,),
                              labelText: signInTextEmail.tr,

                               hasGreenBorder: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height:  80,
                            child: CustomInputField(
                              hasIntialValue: false,
                                textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,

                            hasGreenBorder: true,
                              labelText: signInTextPass.tr,
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              isAutoValidate: true,
                              obsecure: !controller.visiblePsd,
                              keyboardType: TextInputType.visiblePassword,
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
                        InkWell(
                          onTap: (){
                            Get.to(()=>const ForgettingPasswordScreen());
                          },
                          child:  Text(signInTextForgetPass.tr,
                            style: const TextStyle(
                                fontFamily: fontFamilyName,
                                color: kBlackColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                        ),
                        InkWell(
                          onTap: (){
                            if(!controller.signingIn) {
                              controller.sinningIn(context);
                            }else{
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.loading,
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: Get.width*0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.signingIn?kGrayColor:kBlueColor
                            ),
                            child:  Center(
                              child:  CustomText(signInTextBTN.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily:fontFamilyName,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
