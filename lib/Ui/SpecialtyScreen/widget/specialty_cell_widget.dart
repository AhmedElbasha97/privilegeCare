// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/controller/doctor_list_controller.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class SpecialtyCellWidget extends StatelessWidget {
  const SpecialtyCellWidget({Key? key, required this.title, required this.imageUrl, required this.specialistId}) : super(key: key);
 final String title;
 final String specialistId;
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        bool test4 = Get.isRegistered<DoctorListController>();
        if(test4){
          Get.delete<DoctorListController>();
        }
        Get.to(DoctorScreen(specialistId: specialistId,));
      },
      child: Container(
        height: Get.height*0.07,
        width: Get.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 30,
                    width:30,
                    child: Image.network(imageUrl,fit: BoxFit.fitWidth,),
                  ),const SizedBox(width: 10,),
                  CustomText(title,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),

                ],
              ),
            ),
            const Divider(
              color: kGrayColor,
              height: 1,
              thickness: 1,
              endIndent: 10,
              indent: 30,
            ),

          ],
        ),
      ),
    );
  }
}
