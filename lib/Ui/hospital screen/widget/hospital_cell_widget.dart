// ignore_for_file: sized_box_for_whitespace, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
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

class HospitalCellWidget extends StatefulWidget {
  final HospitalListModel? hospitalData;
  final Function addOrRemoveFromFavorite;
  const HospitalCellWidget({Key? key, required this.hospitalData, required this.addOrRemoveFromFavorite}) : super(key: key);

  @override
  State<HospitalCellWidget> createState() => _HospitalCellWidgetState();
}

class _HospitalCellWidgetState extends State<HospitalCellWidget> {
  bool addedToFavoriteOrNot = true;
  @override
  void initState() {
    super.initState();
    checkHospitalAddedOrNot( "${widget.hospitalData?.id??0}");
  }
  checkHospitalAddedOrNot(String hospitalId) async {
    var status = await FavouriteServices.getAddedOrNotToFavoritesHospital(hospitalId, Get.find<StorageService>().getId);
    if(status == 1){
      addedToFavoriteOrNot =  true;
      setState(() {

      });

    }else{
      addedToFavoriteOrNot =   false;
      setState(() {

      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return    InkWell(

      onTap: (){
        bool test = Get.isRegistered<HospitalDetailedController>();
        if(test){
          Get.delete<HospitalDetailedController>();
        }
        Get.to(()=>HospitalDetailedScreen(hospitalId: "${widget.hospitalData?.id??0}"));

      },
      child: Container(
        width: Get.width,
        child: Column(

          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "${Services.baseUrl}${widget.hospitalData?.image?.length==0?"":widget.hospitalData?.image?[0]??""}",
              imageBuilder: ((context, image){
                return  Container(
                    height: Get.height*0.12,
                    width: Get.width*0.5,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.contain,
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
                    height: Get.height*0.12,
                    width: Get.width*0.8,
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
            ),
            const SizedBox(height: 10,),
            Container(
              width: Get.width,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.hospitalData?.nameEn??"":widget.hospitalData?.name??"",
                  style: const TextStyle(
                      fontFamily: fontFamilyName,

                      color: kBlueColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: Get.width,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.hospitalData?.detailsEn??"":widget.hospitalData?.details??"",

                  style: const TextStyle(
                      fontFamily: fontFamilyName,

                      color: kGreenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ SizedBox(
                  height: 20,
                  width: 15,
                  child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                ),
                  const SizedBox(width: 10,),
                  Container(
                    width: Get.width*0.6,
                    child:  CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.hospitalData?.areaEn??"":widget.hospitalData?.area??"",
                      style: const TextStyle(
                          fontFamily:fontFamilyName,
                          color: kBlueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                      textAlign: TextAlign.start,
                    ),

                  ),




                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [SizedBox(
                  height: 7,
                  width: 20,
                  child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                ),
                  const SizedBox(width: 10,),
                  Container(
                    width: Get.width*0.4,
                    child: CustomText(widget.hospitalData?.phone??"",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: fontFamilyName,
                          color: kBlueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                widget.addOrRemoveFromFavorite();
                Future.delayed(Duration(seconds: 1), () {
                  checkHospitalAddedOrNot("${widget.hospitalData?.id??""}");

                });


              },
              child: Container(
                width: Get.width*0.5,
                height: Get.height*0.04,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child:  Center(
                  child: addedToFavoriteOrNot? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.favorite,color: kWhiteColor,),
                      CustomText(removeToFavoriteBTN.tr,
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),),
                    ],
                  ): Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.favorite_border_rounded,color: kWhiteColor,),
                        CustomText(addToFavoriteBTN.tr,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),),
                      ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Divider(
              color: kGreenColor,
              height: 1,
              thickness: 2,
              endIndent: 40,
              indent: 40,
            ),
          ],
        ),
      ),
    );
  }
}
