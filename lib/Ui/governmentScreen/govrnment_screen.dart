// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/governmentScreen/controller/government_controller.dart';
import 'package:privilegecare/Ui/governmentScreen/widget/government_cell_widget.dart';
import 'package:privilegecare/Ui/governmentScreen/widget/loading_government_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/translation_key.dart';


class GovernmentScreen extends StatelessWidget {
  final String specialistId;
  final String searchName;
  const GovernmentScreen({Key? key, required this.specialistId,  this.searchName ="0"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:GetBuilder<GovernmentController>(
        init: GovernmentController(),
        builder: (controller) =>  Scaffold(
            appBar:AppBar(
              backgroundColor: kGreenColor,
              leadingWidth: 60,
              leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
                Get.back();
              },),
              centerTitle: true,
              title:   Text(
                chooseGov.tr,
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ),
            backgroundColor: kLightGrayColor,
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: controller.isLoading?const LoadingGovernmentWidget()
                        :Container(
                      height: Get.height*0.75,
                      width: Get.width*0.9,
                      child: ListView.builder(
                        itemCount: controller.governmentData?.length??0,

                        itemBuilder: (_,index){
                          return  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GovernmentCellWidget(government: controller.governmentData![index], specialistId: specialistId,searchName: searchName,),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
