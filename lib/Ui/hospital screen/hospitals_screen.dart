// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Ui/hospital%20screen/controller/hospitall_controller.dart';
import 'package:privilegecare/Ui/hospital%20screen/widget/hospital_cell_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';

class HospitalScreens extends StatefulWidget {

  const HospitalScreens({Key? key}) : super(key: key);

  @override
  State<HospitalScreens> createState() => _HospitalScreensState();
}

class _HospitalScreensState extends State<HospitalScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 3,),
        body: GetBuilder<HospitalController>(
          init: HospitalController(),
          builder: (controller) =>  SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height*0.12,
                  width: Get.width*0.5,
                  child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Container(
                    color: Colors.white,
                    height: Get.height*0.05,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.specialtyListData?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildChip(controller.specialtyListData?[index].name??"",controller.selectedIndex==index,
                                (){
                          controller.selectingTag(index);
                            },"https://privilegecare.net${controller.specialtyListData?[index].image}"
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10,),
                controller.isLoading?Loader(width: Get.width*0.9,
                  height: Get.height*0.65,):Container(
                  width: Get.width*0.9,
                  height: Get.height*0.65,
                  child: RawScrollbar(
                    thumbColor: kBlueColor,
                    radius: const Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      itemCount:controller.hospitalListData?.length,

                      itemBuilder: (_,index){
                        return   Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: HospitalCellWidget(hospitalData: controller.hospitalListData?[index],),
                        );
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildChip(String label, bool isSelected,Function onPressed,String imageUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: ActionChip(
      elevation: 8.0,
      padding: const EdgeInsets.all(.0),
      avatar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kGreenColor,width: 1),
          borderRadius: BorderRadius.circular(50)
        ),
        child: CircleAvatar(
          backgroundColor: kWhiteColor,

          child:  SizedBox(
            height: 30,
            width:30,
            child: Image.network(imageUrl,fit: BoxFit.fitWidth,),
          ),
        ),
      ),
      label: Text(label,style: TextStyle(
          fontFamily: fontFamilyName,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: isSelected?kWhiteColor:kBlueColor
      ),),
      onPressed: () {
        onPressed();

      },
      backgroundColor: isSelected?kBlueColor:kWhiteColor,
      shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: isSelected?kWhiteColor:kBlueColor,
          )),
    ),
  );
}