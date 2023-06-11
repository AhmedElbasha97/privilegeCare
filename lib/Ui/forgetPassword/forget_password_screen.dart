// ignore_for_file: sized_box_for_whitespace

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/forgetPassword/controller/forget_password_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class ForgettingPasswordScreen extends StatelessWidget {
  const ForgettingPasswordScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
      builder: (controller) =>  Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kGreenColor,


          leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:   Text(
            forgetPassTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height*0.9,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(signUpTitleEmail.tr,
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
                InkWell(
                  onTap: (){
                    if(
                    controller.forgettingPassword){
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
                          color:controller.forgettingPassword?kGrayColor:kBlueColor
                      ),
                      child: const Center(
                        child:  Text("Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
    );
  }
}