// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:privilegecare/Models/comment_model.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';


class CommentWidget extends StatelessWidget {
  final CommentModel data;
  const CommentWidget({Key? key, required this.data}) : super(key: key);
  String returnDateAndTime(String dateAndTime){
    String dateOrTime = "" ;
    final format = DateFormat('HH:mm a');
    DateFormat formatDate = DateFormat("yyyy MMM dd");
    final dateTime = DateTime.parse(dateAndTime);
    if(dateTime.day == DateTime.now().day){
      dateOrTime = format.format(dateTime);
    }else{
      dateOrTime = formatDate.format(dateTime);
    }
    return dateOrTime;
  }
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
               CustomText(doctorRating.tr,
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),

              const SizedBox(width: 10,),
              StarRating(
                color: kGreenColor,
                mainAxisAlignment: MainAxisAlignment.center,
                length: 5,
                rating: data.doctorRate??0.0,
                between: 5,
                starSize: 20,
                onRaitingTap: (rating) {

                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: Get.width*0.9,
              child:  CustomText(data.review??"",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),
            ),
          ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: Get.width*0.9,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(data.name??"",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),
                  const SizedBox(height: 10,),
                  CustomText(returnDateAndTime(data.datetime??""),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),
                ],
              ),
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
