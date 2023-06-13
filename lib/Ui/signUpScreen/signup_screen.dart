import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/controller/signup_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

import '../../Utils/translation_key.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kGreenColor,
          actions:  [ TextButton(onPressed: (){
            Get.to(() => const HomeScreen());
          }, child:  Text(
            skipToHomeBTN.tr,
            style: const TextStyle(
              fontSize: 10.0,
              fontFamily: fontFamilyName,
              color: kWhiteColor,
            ),
          )),],
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:  CustomText(
            signUpTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height*1.01,
            width: Get.width,
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SizedBox(
                        height: Get.height*0.13,
                        width: Get.width*0.5,
                        child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
                      ),
                    ),
                  ),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                     child: Text(signUpTitleName.tr,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                   ),
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height*0.09,
                    child: Row(
                      children: [
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: Get.height*0.09,
                          width: Get.width*0.28,
                          child: CustomInputField(
                            textAligning: TextAlign.center,
                            hasIntialValue: true,
                            labelText: signUpTextName1.tr,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,

                            controller:controller.firstNameController,
                            onchange: controller.onFirstNameUpdate,
                            validator: controller.validateFirstName,
                            icon: (controller.firstNameValidated)
                                ? (controller.firstNameState)
                                ? const Icon(Icons.check_rounded,
                                color: kBlueColor)
                                : const Icon(
                              Icons.close_outlined,
                              color: kErrorColor,
                            )
                                : null,
                            hasGreenBorder: false,
                          ),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: Get.height*0.09,
                            width: Get.width*0.28,
                            child: CustomInputField(
                              textAligning: TextAlign.center,
                              hasIntialValue: true,
                              labelText: signUpTextName2.tr,
                              textInputAction: TextInputAction.next,

                              controller:controller.secondNameController,
                              onchange: controller.onSecondNameUpdate,
                              validator: controller.validateSecondName,
                              icon: (controller.secondNameValidated)
                                  ? (controller.secondNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kBlueColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : null,
                              hasGreenBorder: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: Get.height*0.09,
                            width: Get.width*0.28,
                            child: CustomInputField(
                              textAligning: TextAlign.center,
                              hasIntialValue: true,
                              labelText:signUpTextName3.tr,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,

                              controller:controller.lastNameController,
                              onchange: controller.onLastNameUpdate,
                              validator: controller.validateLastName,
                              icon: (controller.lastNameValidated)
                                  ? (controller.lastNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kBlueColor)
                                  : const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              )
                                  : null,
                              hasGreenBorder: false,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(signUpTitleEmail.tr,
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
                        labelText: signUpTextEmail.tr,

                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,

                        controller:controller.emailController,
                        onchange: controller.onEmailUpdate,
                        validator: controller.validateEmail,
                        icon: (controller.emailValidated)
                            ? (controller.emailState)
                            ? const Icon(Icons.check_rounded,
                            color: kBlueColor)
                            : const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        )
                            : null,
                        hasGreenBorder: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(signUpTitlePhone.tr,
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
                        labelText: signUpTextPhone.tr,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,

                        controller:controller.phoneController,
                        onchange: controller.onPhoneNumberUpdate,
                        validator: controller.validatePhoneNumber,
                        icon: (controller.phoneValidated)
                            ? (controller.phoneState)
                            ?  Row(
                          mainAxisSize: MainAxisSize.min,
                              children: [

                                CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: fontFamilyName,
                                  color: kGrayColor,
                                ),),
                                const Icon(Icons.check_rounded,
                                color: kBlueColor),
                                const SizedBox(width: 5,),
                              ],
                            )
                            :  Row(
                          mainAxisSize: MainAxisSize.min,
                              children: [

                                CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: fontFamilyName,
                                  color: kGrayColor,
                                ),),
                                const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        ),const SizedBox(width: 5,),
                              ],
                            )
                            :  Row(
                          mainAxisSize: MainAxisSize.min,
                              children: [

                                CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: fontFamilyName,
                          color: kGrayColor,
                        ),),
                              ],
                            ),
                        hasGreenBorder: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(signUpTitlePass.tr,
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
                    child: CustomText(signUpTitleConfirmPass.tr,
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RichText(
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
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      if(
                      controller.signingUp){
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
                            color:controller.signingUp?kGrayColor:kBlueColor
                        ),
                        child:  Center(
                          child:  CustomText(signUpBTN.tr,
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
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        CustomText(signUpText1.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily:fontFamilyName,
                            color: kGrayColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),),
                        const SizedBox(width: 5,),
                        InkWell(
                        onTap: (){
                          Get.to(const LoginScreen());
                        },
                        child:  CustomText(signUpText2.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),),
                      ),




                      ],
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
