// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/governmentScreen/controller/government_controller.dart';
import 'package:privilegecare/Ui/governmentScreen/widget/government_cell_widget.dart';
import 'package:privilegecare/Ui/governmentScreen/widget/loading_government_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class GovernmentScreen extends StatelessWidget {
  const GovernmentScreen({Key? key}) : super(key: key);

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
              title:  const Text(
                "أختر المدينة",
                style: TextStyle(
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
                  Container(
                    height: Get.height*0.06,
                    width: Get.width*0.85,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kGreenColor,width: 2),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Icon(
                          Icons.search_outlined,
                          color: kGrayColor,
                          size: 30,),
                        SizedBox(width: 15,),
                        Text("أبحث فى كل المدن",
                          style: TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                      ],
                    ),
                  ),
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
                            child: GovernmentCellWidget(government: Get.find<StorageService>().activeLocale == SupportedLocales.english?(controller.governmentData?[index].nameEn??""):(controller.governmentData?[index].name??""),),
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
