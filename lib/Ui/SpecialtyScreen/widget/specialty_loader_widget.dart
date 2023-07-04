// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';

class SpecialtyLoaderWidget extends StatelessWidget {
  const SpecialtyLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height*0.4,
      child: RawScrollbar(
        thumbColor: kBlueColor,
        radius: const Radius.circular(20),
        thickness: 5,
        child: ListView.builder(
          itemCount: 5,

          itemBuilder: (_,index){
            return InkWell(
                onTap: (){
                },
                child: SizedBox(
                  height: Get.height*0.1,
                  width: Get.width,
                  child:  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color:kWhiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFDFDDDF),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ).animate(onPlay: (controller) => controller.repeat())
                                  .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(10))
                                  .animate() // this wraps the previous Animate in another Animate
                                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                  .slide(),
                              const SizedBox(width:10),
                              Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFDFDDDF),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ).animate(onPlay: (controller) => controller.repeat())
                                  .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(10))
                                  .animate() // this wraps the previous Animate in another Animate
                                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                  .slide(),
                              const SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                        height: 1,
                        thickness: 1,
                        endIndent: 10,
                        indent: 30,
                      ),
                    ],
                  ),
                )
            )
            .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(85))
                .animate() // this wraps the previous Animate in another Animate
                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
            .slide();
          },
        ),
      ),
    );
  }
}
