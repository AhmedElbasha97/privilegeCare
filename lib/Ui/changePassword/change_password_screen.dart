import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBar(
  backgroundColor: kGreenColor,
  leadingWidth: 60,
  leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
    Get.back();
  },),
  centerTitle: true,
  title:  const Text(
    "تغير كلمه السر",
    style: TextStyle(
        fontFamily: fontFamilyName,
        color: kWhiteColor,
        fontWeight: FontWeight.w800,
        fontSize: 18),
  ),

),
    );
  }
}