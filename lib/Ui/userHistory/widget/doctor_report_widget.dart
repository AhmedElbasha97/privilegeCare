import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/history_data_model.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

import '../../../Utils/translation_key.dart';


class DoctorReport extends StatelessWidget {
  final  HistoryDataModel? historyData;
  const DoctorReport({Key? key, this.historyData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child:  Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(10.0),
            child: historyData?.diagnosis == null?  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/Documents-amico.png",height: Get.width*0.65,),
                 Text(noDoctorReport.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 50,
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            color: Colors.black12,
                          ),
                        ],
                        border: Border.all(
                            color: kBlueColor,
                            width: 2.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [Text(
                              goBack.tr,
                              style: const TextStyle(
                                  fontFamily:fontFamilyName,
                                  color:kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)
                          ),

                          ],

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                 Text("${doctorReport.tr}${historyData?.doctor??""}",
                  style: const TextStyle(
                      fontFamily: fontFamilyName,
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),),
                 const SizedBox(height: 10,),
                 Container(
                   constraints: BoxConstraints(
                     maxHeight: Get.height*0.5
                   ),
                   width: Get.width*0.8,
                   child: SingleChildScrollView(
                     child: Text(historyData?.diagnosis??"",
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                   ),
                 ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 50,
                      width: Get.width*0.43,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            color: Colors.black12,
                          ),
                        ],
                        border: Border.all(
                            color: kBlueColor,
                            width: 2.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [Text(
                              goBack.tr,
                              style: const TextStyle(
                                  fontFamily:fontFamilyName,
                                  color:kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)
                          ),

                          ],

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}