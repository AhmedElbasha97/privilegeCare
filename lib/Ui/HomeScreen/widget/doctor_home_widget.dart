// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctor_home_model.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../../Utils/localization_services.dart';

class DoctorHomeWidget extends StatelessWidget {
  const DoctorHomeWidget({Key? key, required this.doctorData}) : super(key: key);
  final DoctorHomeModelData? doctorData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  InkWell(
        onTap: (){
          Get.to(DoctorDetailedScreen(doctorId: "${doctorData?.id??0}"));
        },
        child: Container(
          width: 120,

          child: Column(

            children: [
              CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: "${Services.baseUrl}${doctorData?.image??""}",
                imageBuilder: ((context, image){
                  return  Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),


                      )
                  );
                }),
                placeholder: (context, image){
                  return  const Center(child: CircularProgressIndicator(color: kBlueColor,));
                },
                errorWidget: (context, url, error){
                  return Container(
                      height: 80,
                      width: 80,

                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/doctor.png"),
                          fit: BoxFit.fill,
                        ),


                      )
                  );
                },
              ),
              const SizedBox(height: 5),
              CustomText( Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.nameEn??"":doctorData?.name??"",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 1,
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),),
              const SizedBox(height: 5,),
              CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?doctorData?.specialistEn??"":doctorData?.specialist??"",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 1,

                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11),),
            ],
          ),
        ),
      ),
    );
  }
}
