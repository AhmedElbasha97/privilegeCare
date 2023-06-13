import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class ProfileCellWidget extends StatelessWidget {
  final String profileTextTap;
  final String profileIcon;
   const ProfileCellWidget({Key? key, required this.profileTextTap, required this.profileIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Get.height*0.06,
      width: Get.width*0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kBlueColor,width: 2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 6,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [

            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 50,
                  child: Image.asset(profileIcon,fit: BoxFit.fitHeight,),
                ),

                CustomText(profileTextTap,
                  style: const TextStyle(
                      fontFamily: fontFamilyName,
                      color: kBlueColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),),
              ],
            ),
           const Icon(Icons.arrow_forward_ios_rounded,size: 30,color: kBlueColor,),
          ],
        ),
      ),
    );
  }
}
