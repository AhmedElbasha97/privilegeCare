
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';


class ReservationSuccessWidget extends StatelessWidget {
  final String doctorName;
  const ReservationSuccessWidget({Key? key, required this.doctorName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child:
       Container(
         width: MediaQuery.of(context).size.width * 0.9,
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children:  [
             SizedBox(
               height: Get.height*0.12,
               width: Get.width*0.5,
               child: Image.asset("assets/images/reservationSuccess.jpg",fit: BoxFit.fitWidth,),
             ),
             Container(
               width: MediaQuery.of(context).size.width * 0.9,
               child: Text("تم حجز الدكتور $doctorName بنجاح ",
                 style: const TextStyle(
                     height: 1,
                     fontFamily: fontFamilyName,
                     color: kGreenColor,
                     fontWeight: FontWeight.w700,
                     fontSize: 14),),
             ),

           ],
         ),
       ),
      );

  }
}