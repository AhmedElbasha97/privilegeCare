import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class UnderConstructionScreen extends StatefulWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  State<UnderConstructionScreen> createState() => _UnderConstructionScreenState();
}

class _UnderConstructionScreenState extends State<UnderConstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar:AppBar(
        backgroundColor: kGreenColor,
        leadingWidth: 60,
        leading: IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
          Get.back();
        },),
        centerTitle: true,

      ),
    body: SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height*0.7,
            width: Get.width*0.8,
            child: Image.asset("assets/images/Under construction-amico.png",fit: BoxFit.fitWidth,),
          ), const SizedBox(height: 10),
          const Text("هذه الصفحه جارى العمل عليه",
            style: TextStyle(
                height: 1,
                fontFamily: fontFamilyName,
                color: kBlueColor,
                fontWeight: FontWeight.w800,
                fontSize: 20),),
        ],
      ),
    ),
    ));
  }
}
