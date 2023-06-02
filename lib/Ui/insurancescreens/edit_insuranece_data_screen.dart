import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/insurancescreens/controller/insurance_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class  EditInsuranceDataScreen extends StatelessWidget {
  final bool addingNewCard;
  const  EditInsuranceDataScreen({super.key, required this.addingNewCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: kGreenColor,
      leadingWidth: 60,
      leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
        Get.back();
      },),
      centerTitle: true,
      title:   Text(
        addingNewCard?"اضافه بطاقه التأمين الصحى":"تعديل بينات بطاقه التأمين الصحي",
        style: TextStyle(
            fontFamily: fontFamilyName,
            color: kWhiteColor,
            fontWeight: FontWeight.w800,
            fontSize: 18),
      ),

    ),
      body:  SizedBox(
        height: Get.height,
        width: Get.width,

        child:  GetBuilder<InsuranceController>(
          init: InsuranceController(),
          builder: (controller) => Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height*0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          children:[
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("ادخل اسم شركه التأمين",
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
                                      width: Get.width*0.9,
                                      child: CustomInputField(
                                        textAligning: TextAlign.center,
                                        hasIntialValue: true,
                                        labelText: "شركه التأمين",
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.name,
                                        controller:controller.companyNameController,
                                        onchange: controller.onCompanyNameUpdate,
                                        validator: controller.validateCompanyName,
                                        icon: (controller.companyNameValidated)
                                            ? (controller.companyNameState)
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
                              child: Text("ادخل رقم بطاقة التأمين",
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
                                  labelText: "",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller:controller.healthInsuranceNumberController,
                                  onchange: controller.onHealthInsuranceNumberUpdate,
                                  validator: controller.validateHealthInsuranceNumber,
                                  icon: (controller.healthInsuranceNumberValidated)
                                      ? (controller.healthInsuranceNumberState)
                                      ? const Icon(Icons.check_rounded,
                                      color: kBlueColor)
                                      : const Icon(
                                    Icons.close_outlined,
                                    color: kErrorColor,
                                  )
                                      :null,
                                  hasGreenBorder: false,
                                ),
                              ),
                            ),

                          ]
                      ),
                      InkWell(
                        onTap: (){
                          if(
                          controller.editingInsuranceCard){
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
                                color:controller.editingInsuranceCard?kGrayColor:kBlueColor
                            ),
                            child:  Center(
                              child:  Text(addingNewCard?"اضافه بطاقه التأمين الصحى":"تعديل بينات بطاقه التأمين الصحي",
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
        ),
      ),
    );
  }
}
