import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/logInScreen/Controller/login_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';


class LoginDialogue extends StatelessWidget {
  const LoginDialogue({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: GetBuilder(
        init:  LoginController(),
        builder: ( controller) => SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,

            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  const Text("Hello",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),),
                  const Text("Sign into your account",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kGrayColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 80,
                      child: CustomInputField(
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
                            : null,
                        labelText: "Email",

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

                          hasGreenBorder: true,
                          labelText: "Password",
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
                  const Text("Forget Your Password",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),
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
                      child: const Center(
                        child:  Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}