import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/insurancescreens/controller/insurance_controller.dart';
import 'package:privilegecare/Ui/insurancescreens/edit_insuranece_data_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/loader.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InsuranceController>(
      init: InsuranceController(),
      builder: (controller) =>SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kGreenColor,
            leadingWidth: 60,
            leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
              Get.back();
            },),
            centerTitle: true,
            title:   Text(
              insuranceDataTitle.tr,
              style: const TextStyle(
                  fontFamily: fontFamilyName,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),

          ),
          body:controller.isLoading?const Loader():controller.hasNoData?SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Insurance-pana.png",height: Get.width*0.65,),
                   Text(insuranceNoData.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
                  const SizedBox(height: 30,),
                 InkWell(
                    onTap: (){
                      Get.to(()=>EditInsuranceDataScreen(addingNewCard: controller.hasNoData,));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 50,
                        width: Get.width*0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: kGreenColor,
                              width: 2.0,
                              style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [Text(
                                insuranceAddData.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,
                                    color:kGreenColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20)
                            ),
                              const SizedBox(width: 10,),
                              const Icon(Icons.add,color: kGreenColor,)
                            ],

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ):SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(insuranceDataCompName.tr,
                                    style: const TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kGreenColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),),
                                ),
                                Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(controller.healthInsuranceData?.insurance??"",
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(insuranceDataNum.tr,
                                    style: const TextStyle(
                                        fontFamily: fontFamilyName,
                                        color: kGreenColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),),
                                ),
                                Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(controller.healthInsuranceData?.card??"",
                                      style: const TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>EditInsuranceDataScreen(addingNewCard: controller.hasNoData,));
                  },
                  child: Center(
                    child: Container(
                      height: 60,
                      width: Get.width*0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:kBlueColor
                      ),
                      child:  Center(
                        child:  Text(controller.hasNoData?insuranceAddData.tr:insuranceDataEdit.tr,
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
    );
  }
}
