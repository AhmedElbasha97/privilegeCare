import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/government_model.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class GovernmentCellWidget extends StatelessWidget {
  final GovernmentModel? government;
  final String specialistId;
  final String searchName;
   const GovernmentCellWidget({Key? key, required this.government, required this.specialistId,  this.searchName="0"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Get.to(() => DoctorScreen(specialistId: specialistId,searchName: searchName,areaId:"${ government?.id??0}",));
      },
      child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const SizedBox(width: 5,),

            Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?(government?.nameEn??""):(government?.name??""),
              style: const TextStyle(
                  fontFamily: fontFamilyName,
                  color: kGrayColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
