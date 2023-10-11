import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';

class NotificationLoader extends StatelessWidget {
  const NotificationLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),

      separatorBuilder: (_, __) => const SizedBox(height: 0),
      itemCount:15,
      itemBuilder: (_, index) =>  InkWell(
          onTap: (){
          },
          child: SizedBox(
            height: Get.height*0.14,
            child:  Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color:kLightGrayColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child:  Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color:kWhiteColor,
                                  borderRadius: BorderRadius.circular(50)
                              ),

                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(10))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                            .slide(),
                        const SizedBox(width:10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            const SizedBox(height: 10,),
                            Container(
                              width: 200,
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: kGrayColor,
                  height: 1,
                  thickness: 2,

                ),
              ],
            ),
          )
      ),
    ).animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(85))
        .animate() // this wraps the previous Animate in another Animate
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
        .slide();
  }
}
