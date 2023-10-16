import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_banner_model.dart';
import 'package:privilegecare/Ui/hospitalDetailed/controller/hospital_detailed_controller.dart';
import 'package:privilegecare/Ui/hospitalDetailed/hospital_detailed_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';

class HospitalsBannersWidget extends StatelessWidget {
  const HospitalsBannersWidget({Key? key, required this.hospitalBanner}) : super(key: key);
  final HospitalBannerModel? hospitalBanner;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: (){
          bool test = Get.isRegistered<HospitalDetailedController>();
          if(test){
            Get.delete<HospitalDetailedController>();
          }
          Get.to(()=>HospitalDetailedScreen(hospitalId: "${hospitalBanner?.id}"));
        },
        child: Column(
          children: [
            SizedBox(
              width:Get.width*0.8,
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        Get.find<StorageService>().activeLocale == SupportedLocales.english?hospitalBanner?.nameEn??"":hospitalBanner?.name??"",

                        style: const TextStyle(
                            height: 1,
                            fontFamily: fontFamilyName,
                            color: kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),),
                      const SizedBox(height: 5,),
                      CustomText(
                        hospInfo.tr,

                        style: const TextStyle(
                            height: 1,
                            fontFamily: fontFamilyName,
                            color: kBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),),
                    ],
                  ),
                  CustomText(moreInfoHosp.tr,

                    style: const TextStyle(
                        height: 1,
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            hospitalBanner?.image?.length==0?Container(
                width: Get.width*0.9,
                height: Get.height*0.2,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/no_data_slideShow.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(15))

                )
            ):
            CarouselSlider(
              options:  CarouselOptions(
                  height: Get.height*0.19,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  autoPlay: true),

              items: hospitalBanner?.image?.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return  CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      imageUrl: "${Services.baseUrl}$i",
                      imageBuilder: ((context, image){
                        return  Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.fitHeight,
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(15))

                            )
                        );
                      }),
                      placeholder: (context, image){
                        return  Padding(
                          padding:  const EdgeInsets.all(5),
                          child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))
                              ),
                              child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
                        );
                      },
                      errorWidget: (context, url, error){
                        return Container(
                            width: MediaQuery.of(context).size.width,

                            height: Get.height*0.2,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/no_data_slideShow.png"),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))

                            )
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 15,),
            const Divider(
              color: kGreenColor,
              height: 1,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
