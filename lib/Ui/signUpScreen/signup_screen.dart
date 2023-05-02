import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/controller/signup_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

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
          leading: IconButton(icon: const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:  const Text(
            "Sign Up",
            style: TextStyle(
                fontFamily: "Inter",
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
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
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10.0),
                     child: Text("Enter Your Full Name",
                      style: TextStyle(
                          fontFamily: "Inter",
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
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              labelText: "First",
                              controller:controller.firstNameController,
                              onchange: controller.onFirstNameUpdate,
                              validator: controller.validateFirstName,
                              icon: (controller.firstNameValidated)
                                  ? (controller.firstNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kSuccessColor)
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
                              textInputAction: TextInputAction.next,
                              labelText: "Middle",
                              controller:controller.secondNameController,
                              onchange: controller.onSecondNameUpdate,
                              validator: controller.validateSecondName,
                              icon: (controller.secondNameValidated)
                                  ? (controller.secondNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kSuccessColor)
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
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              labelText: "Last",
                              controller:controller.lastNameController,
                              onchange: controller.onLastNameUpdate,
                              validator: controller.validateLastName,
                              icon: (controller.lastNameValidated)
                                  ? (controller.lastNameState)
                                  ? const Icon(Icons.check_rounded,
                                  color: kSuccessColor)
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Email",
                      style: TextStyle(
                          fontFamily: "Inter",
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        labelText: "omar.khaled20@yahoo.com",
                        controller:controller.emailController,
                        onchange: controller.onEmailUpdate,
                        validator: controller.validateEmail,
                        icon: (controller.emailValidated)
                            ? (controller.emailState)
                            ? const Icon(Icons.check_rounded,
                            color: kSuccessColor)
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Phone Number",
                      style: TextStyle(
                          fontFamily: "Inter",
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        labelText: "20",
                        controller:controller.phoneController,
                        onchange: controller.onPhoneNumberUpdate,
                        validator: controller.validatePhoneNumber,
                        icon: (controller.phoneValidated)
                            ? (controller.phoneState)
                            ? const Icon(Icons.check_rounded,
                            color: kSuccessColor)
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Enter Your Password",
                      style: TextStyle(
                          fontFamily: "Inter",
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: true,
                          labelText: "**********************",
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
                    child: Text("Confirm Your Password",
                      style: TextStyle(
                          fontFamily: "Inter",
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
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          hasGreenBorder: true,
                          labelText: "**********************",
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
                        height: 70,
                        width: Get.width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:controller.signingUp?kGrayColor:kBlueColor
                        ),
                        child: const Center(
                          child:  Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),),
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
                        const Text("Already have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: kGrayColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),),
                        const SizedBox(width: 5,),
                        InkWell(
                          onTap: (){
                            Get.to(const LoginScreen());
                          },
                          child: const Text("Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter",
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
