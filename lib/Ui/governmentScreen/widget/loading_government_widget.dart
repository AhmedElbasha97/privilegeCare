// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';

class LoadingGovernmentWidget extends StatelessWidget {
  const LoadingGovernmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height:  Get.height*0.75,
      child: RawScrollbar(
        thumbColor: kBlueColor,
        radius: const Radius.circular(20),
        thickness: 5,
        child: ListView.builder(
          itemCount: 10,

          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.85,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kGreenColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 5,),

                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms,
                            color: kLightGrayColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ],
                    ),
                  )
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(
                  duration: 1200.ms, color: kLightGrayColor.withAlpha(85))
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                  .slide(),
            );
          },
        ),
      ),
    );
  }
}