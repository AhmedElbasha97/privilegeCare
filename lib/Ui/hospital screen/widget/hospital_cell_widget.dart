// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class HospitalCellWidget extends StatefulWidget {
  const HospitalCellWidget({Key? key}) : super(key: key);

  @override
  State<HospitalCellWidget> createState() => _HospitalCellWidgetState();
}

class _HospitalCellWidgetState extends State<HospitalCellWidget> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      width: Get.width,
      child: Column(

        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  color: Colors.black12,
                ),
              ],
            ),

            height: Get.height*0.2,
            width: Get.width*0.9,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/hospitalImage.jpg",fit: BoxFit.fitHeight,)),
          ),
          const SizedBox(height: 10,),
          Container(
            width: Get.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("عن المستشفي",

                style: TextStyle(
                    fontFamily: fontFamilyName,

                    color: kBlueColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: Get.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("احدى المستشفيات التي تتميز بوجود صفوة الاطباء و الاستشار يين في مختلف التخصصات الطبية ومتعاقده معکافه النقابات والعديد من شركات الرعاية وتضم عيادات في جميع التخصصات الطبية وأطباء على أعلى مستوى من الجاهزية والخبرة.",

                style: TextStyle(
                    fontFamily: fontFamilyName,

                    color: kGreenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ SizedBox(
                height: 25,
                width: 20,
                child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
              ),
                const SizedBox(width: 10,),
                Container(
                  width: Get.width*0.6,
                  child: const Text("المهندسين :شارع جزيرة العرب",
                    style: TextStyle(
                        fontFamily:fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                    textAlign: TextAlign.start,
                  ),

                ),




              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SizedBox(
                height: 10,
                width: 27,
                child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
              ),
                const SizedBox(width: 10,),
                Container(
                  width: Get.width*0.18,
                  child: const Text("16754 ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: Get.width*0.4,
            height: Get.height*0.04,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  color: Colors.black12,
                ),
              ],
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite_border_rounded,color: kWhiteColor,),
                  Text("أضف إلى المفضلة",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: kGreenColor,
            height: 1,
            thickness: 2,
            endIndent: 40,
            indent: 40,
          ),
        ],
      ),
    );
  }
}
