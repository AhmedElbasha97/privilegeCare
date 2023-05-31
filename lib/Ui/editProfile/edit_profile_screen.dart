import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/editProfile/controller/edit_profile_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) => Scaffold(
        appBar:AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: true,
          title:  const Text(
            "تحديث الملف الشخصي",
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),

        ),
        body:controller.isLoading?const Loader(): SingleChildScrollView(
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
                            labelText: "Last",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: Get.height*0.09,
                          width: Get.width*0.28,
                          child: CustomInputField(
                            textAligning: TextAlign.center,
                            hasIntialValue: true,
                            labelText: "Middle",
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
                            labelText: "First",
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
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Enter Your Email",
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
                      labelText: "example@example.com",

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Enter Your Phone Number",
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
                      labelText: "123-4567-8",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,

                      controller:controller.phoneController,
                      onchange: controller.onPhoneNumberUpdate,
                      validator: controller.validatePhoneNumber,
                      icon: (controller.phoneValidated)
                          ? (controller.phoneState)
                          ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text("   974+    ", style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: fontFamilyName,
                            color: kGrayColor,
                          ),),
                          Icon(Icons.check_rounded,
                              color: kBlueColor),
                          SizedBox(width: 5,),
                        ],
                      )
                          : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text("   974+    ", style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: fontFamilyName,
                            color: kGrayColor,
                          ),),
                          Icon(
                            Icons.close_outlined,
                            color: kErrorColor,
                          ),SizedBox(width: 5,),
                        ],
                      )
                          : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text("   974+    ", style: TextStyle(
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

                InkWell(
                  onTap: (){
                    if(
                    controller.editProfile){
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
                          color:controller.editProfile?kGrayColor:kBlueColor
                      ),
                      child: const Center(
                        child:  Text("تحديث الملف الشخصي",
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