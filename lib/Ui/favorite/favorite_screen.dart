import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/favorite/widget/favorite_doctor_taps.dart';
import 'package:privilegecare/Ui/favorite/widget/favourite_hospital_taps.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../Utils/memory.dart';
import '../../Utils/translation_key.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                  SliverAppBar(
                    leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
                      Get.back();
                    },),
                  backgroundColor: kGreenColor,
                  title: CustomText(favTitle.tr, style: const TextStyle(
                      fontFamily: fontFamilyName,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),),
                  centerTitle: false,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    indicatorColor: kBlueColor,
                    indicatorWeight: 10,
                    tabs: [
                      Tab(child: CustomText(favTap1.tr, style: const TextStyle(
              fontFamily: fontFamilyName,
              color: kWhiteColor,
              fontWeight: FontWeight.w800,
              fontSize: 18))),
                      Tab(child: CustomText(favTap2.tr,style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 18))),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
                children: <Widget>[
                  FavouriteDoctorsTap(),
                  FavouriteHospitalTap(),

                ],
              ),
            ),
          ),
    );
  }
}
