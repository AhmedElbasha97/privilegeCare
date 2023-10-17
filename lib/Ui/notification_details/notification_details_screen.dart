import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/notification_details/controller/notificaation_detailed_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({Key? key, required this.notificationId}) : super(key: key);
  final String notificationId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationDetailedController>(
      init: NotificationDetailedController(notificationId),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();

          },),
          centerTitle: true,
          title: CustomText(
            Localizations.localeOf(context).languageCode == "en"
                ?"Notification Details":"تفاصيل الأشعر",
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),



        ),
        body:Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    controller.isLoading?Container(
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
                        .slide():Container(
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: kBlueColor,width: 1),
                          shape: BoxShape.circle
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kGreenColor,width: 1),
                            shape: BoxShape.circle
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              "assets/images/logo.png"
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.isLoading?Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 150,
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
                          ):CustomText( Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.notificationsData?.titleEn??"":controller.notificationsData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),),
                            controller.isLoading?Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 80,
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
                            ):CustomText(
                            controller.returnDateAndTime(controller.notificationsData?.date??""),

                            style: const TextStyle(
                                fontFamily: fontFamilyName,
                                color: kGreenColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    border: Border.all(color: kBlueColor,width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kGreenColor,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.isLoading?Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width*0.85,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width*0.85,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width*0.85,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width*0.85,
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
                        ),
                      ],
                    ).animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color:  kLightGrayColor.withAlpha(10))
                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide():CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.notificationsData?.descEn??"":controller.notificationsData?.desc??"",
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kBlueColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    maxLines: null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
