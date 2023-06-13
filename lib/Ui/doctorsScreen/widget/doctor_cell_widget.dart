// ignore_for_file: sized_box_for_whitespace, prefer_is_empty, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Ui/reservationScreen/reservation_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';

class DoctorCellWidget extends StatefulWidget {
  final DoctorListModel? doctorData;

  final VoidCallback  addingToFavorite;
  const DoctorCellWidget({Key? key, required this.doctorData, required this.addingToFavorite,}) : super(key: key);

  @override
  State<DoctorCellWidget> createState() => _DoctorCellWidgetState();
}

class _DoctorCellWidgetState extends State<DoctorCellWidget> {
   bool addedToFavoriteOrNot = true;
@override
  void initState() {
    super.initState();
    checkDoctorAddedOrNot( "${widget.doctorData?.id??0}");
  }
    checkDoctorAddedOrNot(String doctorId) async {
     var status = await FavouriteServices.getAddedOrNotToFavoritesDoctor(doctorId, Get.find<StorageService>().getId);
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          Get.to( DoctorDetailedScreen(doctorId: "${widget.doctorData?.id??0}",));
        },
        child: SizedBox(

          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "https://privilegecare.net${widget.doctorData?.image??""}",
                        imageBuilder: ((context, image){
                          return  Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.cover,
                                ),


                              )
                          );
                        }),
                        placeholder: (context, image){
                          return  const Center(child: CircularProgressIndicator(color: kBlueColor,));

                        },
                        errorWidget: (context, url, error){
                          return Container(
                              height: 80,
                              width: 80,

                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/doctor.png"),
                                  fit: BoxFit.fill,
                                ),


                              )
                          );
                        },
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.doctorData?.nameEn??"":widget.doctorData?.name??"",

                            style: const TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                           const SizedBox(height: 5,),
                          CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.doctorData?.specialistEn??"":widget.doctorData?.specialist??"",
                            style: const TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),),
                          const SizedBox(height: 5,),
                          StarRating(
                            color: kGreenColor,
                            mainAxisAlignment: MainAxisAlignment.center,
                            length: 5,
                            rating: widget.doctorData?.doctorRate??0.0,
                            between: 0,
                            starSize: 20,
                            onRaitingTap: (rating) {

                            },
                          ),
                          const SizedBox(height: 5,),
                          widget.doctorData?.visitors == 0?
                          CustomText(noReviewsOnDoc.tr,
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),) :CustomText("${reviewsOnDoc1.tr}${widget.doctorData?.visitors??0} ${reviewsOnDoc2.tr}",
                            style: const TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),),

                        ],
                      ),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.doctorData?.listen==0?const SizedBox(height: 15,): Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.35,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/new patient.png",fit: BoxFit.fitWidth,),
                            ),

                              CustomText(docAchievement1.tr,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),

                            ],
                          ),
                        ),
                      ),
                      widget.doctorData?.explain==0?const SizedBox(height: 10,):Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.35,
                          height: Get.height*0.04,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/oldPatient.png",fit: BoxFit.fitWidth,),
                            ),
                              CustomText(docAchievement2.tr,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 20,
                        child: Image.asset("assets/images/specification.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.65,
                        child:  Text(Get.find<StorageService>().activeLocale == SupportedLocales.english?widget.doctorData?.levelEn??"":widget.doctorData?.level??"",
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ),



                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 20,
                        child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.6,
                        child:  Text(widget.doctorData?.hosp??"",
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                          textAlign: TextAlign.start,
                        ),

                      ),




                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 20,
                        child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      CustomText("${reservationPrice1.tr} ${widget.doctorData?.amount} ${reservationPrice2.tr}",
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: kBlueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),),



                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 25,
                        child: Image.asset("assets/images/waitingtime.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.7,
                        child:  Text("${reservationTime1.tr}${widget.doctorData?.waiting} ${reservationTime2.tr}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),),

                      ),




                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 27,
                        child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: Get.width*0.18,
                        child:  Text(widget.doctorData?.phone??"",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),),

                      ),




                    ],
                  ),
                  widget.doctorData?.schedule?.length == 0?Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.7,
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
                            child: Text(noTimeAvailableDocScreen.tr,
                              style: TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: ()  {
                          widget.addingToFavorite();
                           checkDoctorAddedOrNot("${widget.doctorData?.id??0}");

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: Get.width*0.08,
                            height: Get.height*0.04,
                            decoration: BoxDecoration(
                              color: kGreenColor,
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
                              child: addedToFavoriteOrNot?const Icon(Icons.favorite,color: kWhiteColor,):const Icon(Icons.favorite_border_rounded,color: kWhiteColor,),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ):Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>  ReservationScreen(doctorId: "${widget.doctorData?.id??0}",));
                          },
                          child: Container(
                            width: Get.width*0.27,
                            height: Get.height*0.04,
                            decoration: BoxDecoration(
                              color: kGreenColor,
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
                              child: CustomText(reservationBTNDocScreen.tr,
                                style: TextStyle(
                                    fontFamily: fontFamilyName,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.4,
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
                            child: CustomText(" ${availableToDay.tr} ${widget.doctorData!.schedule?[0].timeFrom} ",
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          widget.addingToFavorite();
                         await checkDoctorAddedOrNot("${widget.doctorData?.id??0}");

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: Get.width*0.08,
                            height: Get.height*0.04,
                            decoration: BoxDecoration(
                              color: kGreenColor,
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
                              child: addedToFavoriteOrNot? const Icon(Icons.favorite,color: kWhiteColor,):const Icon(Icons.favorite_border_rounded,color: kWhiteColor,),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
