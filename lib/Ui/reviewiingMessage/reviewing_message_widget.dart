import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reviewiingMessage/controller/reviewing_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:star_rating/star_rating.dart';

import '../../Utils/translation_key.dart';
class ReviewingMessageWidget extends StatelessWidget {
  final  int historyId;
  const ReviewingMessageWidget({Key? key, required this.historyId, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewingController>(
      init: ReviewingController(historyId),
      builder: (controller) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child:  SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: Get.height*0.45,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Row(
                  children: [
                     Text(hospRating.tr,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                    const SizedBox(width: 10,),
                    StarRating(
                      color: kGreenColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 5,
                      rating: controller.hospitalReview,
                      between: 0,
                      starSize: 20,
                      onRaitingTap: (rating) {
                        controller.changeHospitalReview(rating);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                     Text(doctorRating.tr,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                    const SizedBox(width: 10,),
                    StarRating(
                      color: kGreenColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 5,
                      rating: controller.doctorReview,
                      between: 0,
                      starSize: 20,
                      onRaitingTap: (rating) {
                        controller.changeDoctorReview(rating);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                      controller: controller.msgController,
                      maxLines: 4,
                      textAlign: TextAlign.right,
                      decoration:   InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        fillColor: kBlueColor,
                        hintText: comment.tr,
                        errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(4)),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder:  const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kBlueColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder:  const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kBlueColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      )),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    if(!controller.addingReview) {
                      controller.addReview(context);
                    }else{
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.loading,
                      );
                    }
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
                      child:   Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [Text(
                              addReview.tr,
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
        ),
      ),
    );

  }
}