import 'package:flutter/material.dart';
import 'package:privilegecare/Models/doctor_model.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class SchedulesWidget extends StatelessWidget {
  final Schedule? data;
  const SchedulesWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10,),
        Container(
          height: 130,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kBlueColor,width: 1.0),
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 30,
                color: kBlueColor,
                child:  Center(
                  child: Text(data?.date??"",
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 10),),
                ),
              ),
              const SizedBox(height: 5,),
               Text(data?.timeFrom??"",
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 10),),
              const SizedBox(height: 5,),
              const Text("إلى",
                style: TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 10),),
              const SizedBox(height: 5,),
               Text(data?.timeTo??"",
                style: const TextStyle(
                    fontFamily: fontFamilyName,
                    color: kBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 10),),
              const SizedBox(height: 5,),
              Container(
                width: 80,
                height: 27,
                color: kBlueColor,
                child: const Center(
                  child: Text("احجز",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 10),),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
