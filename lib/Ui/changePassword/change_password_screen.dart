// ignore_for_file: sized_box_for_whitespace

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/changePassword/controller/change_password_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
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
  leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
      Get.back();
  },),
  centerTitle: true,
  title:  const Text(
      "تغير كلمه السر",
      style: TextStyle(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("كلمه السر الجديدة",

                      style: TextStyle(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("أعد كتابة كلمة السر الجديدة",
                      style: TextStyle(
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
                  const SizedBox(height: 10,),
                  RichText(
                    text:  const TextSpan(
                      children: [

                        WidgetSpan(
                          child: Icon(Icons.info_sharp, size: 14,color: kBlueColor,),
                        ),
                        TextSpan(
                          text: "يجب أن يكون كلمه السر تحتوى على حرف كبير و حرف صغير ورموز خاصه مثل :(@,#,!,&,*,~)و رقم وليس أقل من ٨أحرف",
                          style:  TextStyle(
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
                        child: const Center(
                          child:  Text("تغير كلمه السر",
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
      ),
    );
  }
}