// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/controller/doctor_list_controller.dart';
import 'package:privilegecare/Ui/doctorsScreen/widget/doctor_cell_widget.dart';
import 'package:privilegecare/Ui/governmentScreen/govrnment_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

class DoctorScreen extends StatelessWidget {
  final String specialistId;
   const DoctorScreen({Key? key, required this.specialistId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 1,),
        body: GetBuilder<DoctorListController>(
          init: DoctorListController(specialistId),
          builder: (controller) => RawScrollbar(
            thumbColor: kBlueColor,
            radius: const Radius.circular(20),
            thickness: 5,
            child: SingleChildScrollView(
              controller: controller.sController,
              child: Column(
                children: [

                  SizedBox(
                    height: Get.height*0.12,
                    width: Get.width*0.5,
                    child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                  ),
                  controller.hasNoData?const SizedBox():InkWell(
                    onTap: (){
                      Get.to(const GovernmentScreen());
                    },
                    child: Container(
                      height: Get.height*0.045,
                      width: Get.width*0.95,
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const SizedBox(width: 5,),
                          const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: kWhiteColor,
                            size: 30,),
                          const SizedBox(width: 90,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [

                              Container(
                                color: kDarkBlueColor,
                                child: const Row(
                                  children: [


                                    Text("كل المناطق ",
                                      style: TextStyle(
                                          fontFamily: fontFamilyName,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),
                                    Icon(Icons.arrow_downward,color: kWhiteColor,size: 18,),
                                  ],
                                ),
                              )
                            ],
                          ),



                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  controller.hasNoData?const SizedBox():Container(
                    height: Get.height*0.06,
                    width: Get.width*0.95,

                    child: TextField(
                      onChanged: (value){
                        controller.searchForDoctor(value);
                      },
                      onSubmitted: (value){
                        controller.searchForDoctor(value);
                      },
                      controller: controller.searchController,
                      cursorColor: kBlueColor,
                      textInputAction: TextInputAction.search,
                      style:  const TextStyle(
                        fontSize: 15.0,
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                      ),
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: kBlueColor,),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:   const BorderSide(color: kBlueColor,width: 3.0),
                            borderRadius: BorderRadius.circular(15)),

                          hintText: "ابحث بالتخصص،اسم الدكتور،أو المستشفي",
                          hintStyle: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGrayColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),

                          prefixIcon:   const Icon(
                            Icons.search_outlined,
                            color: kGrayColor,
                            size: 30,),
                          suffixStyle: const TextStyle(color: kGreenColor)),
                    ),

                  ),
                  controller.hasNoData?const SizedBox():Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width*0.3,
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: kBlueColor,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                Icons.filter_alt,
                                color: kWhiteColor,
                                size: 25,),
                                Text("التصفية ",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: Get.width*0.3,
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: kBlueColor,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                Icons.map_outlined,
                                color: kWhiteColor,
                                size: 15,),
                                Text("الخريطة ",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: Get.width*0.3,
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              color: kBlueColor,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                Icons.mobiledata_off_rounded,
                                color: kWhiteColor,
                                size: 25,),
                                Text("الترتيب ",
                                  style: TextStyle(
                                      fontFamily: fontFamilyName,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller.isLoading?Loader(height: Get.height*0.55,width: Get.width,):controller.hasNoData?NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: "ليس هناك أطباء متخصصين مسجلين فى هذا التخصص حتى الآن", imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: true,height: Get.height*0.7,):controller.searchHasNoResult?NoDataWidget(refreshedFunc: (){
                    controller.getData();
                  }, text: "ليس هناك طبيب بهذا الاسم", imgPath: "assets/images/Search-rafiki.png", hasRefreshButtonOrNot: false,height: Get.height*0.7,):Container(

                    width: Get.width,
                    height: Get.height*0.55,
                    color: kLightGrayColor,
                    child: RawScrollbar(
                      thumbColor: kBlueColor,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView.builder(
                        itemCount: controller.doctorsData?.length,
                        controller: controller.sController,
                        itemBuilder: (_,index){
                          return DoctorCellWidget(doctorData: controller.doctorsData?[index],);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),


            ),
          );

  }
}
