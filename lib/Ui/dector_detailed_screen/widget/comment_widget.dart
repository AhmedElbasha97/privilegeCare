import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20,),
              const Text("التقييم العام",
                style: TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),

              const SizedBox(width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                  ),SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                  ),SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                  ),SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                  ),SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                  ),
                ],
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: Get.width*0.9,
              child: const Text("دكتور قمة فى التواضع والأخلاق وسامعني للاخر ورد علي كل أسئلتي وطمني \nهالة  15 مارس 2023",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: kBlueColor,
            height: 1,
            thickness: 1,
            endIndent: 30,
            indent: 10,
          ),
          const SizedBox(height: 30,),

        ],
      ),
    );
  }
}
