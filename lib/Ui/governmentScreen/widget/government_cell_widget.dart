import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class GovernmentCellWidget extends StatelessWidget {
  final String government;
   const GovernmentCellWidget({Key? key, required this.government}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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

          Text(government,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kGrayColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),),
        ],
      ),
    );
  }
}
