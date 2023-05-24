// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/loader.dart';

class HospitalCellWidget extends StatelessWidget {
  final HospitalListModel? hospitalData;
  const HospitalCellWidget({Key? key, required this.hospitalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: Get.width,
      child: Column(

        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: "https://privilegecare.net${hospitalData?.image??""}",
            imageBuilder: ((context, image){
              return  Container(
                  height: Get.height*0.12,
                  width: Get.width*0.5,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
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
              child: Text(hospitalData?.name??"",
                style: const TextStyle(
                    fontFamily: fontFamilyName,

                    color: kBlueColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: Get.width,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(hospitalData?.area??"",

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
                height: 25,
                width: 20,
                child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
              ),
                const SizedBox(width: 10,),
                Container(
                  width: Get.width*0.6,
                  child:  Text(hospitalData?.address??"",
                    style: const TextStyle(
                        fontFamily:fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
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
                height: 10,
                width: 27,
                child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
              ),
                const SizedBox(width: 10,),
                Container(
                  width: Get.width*0.18,
                  child: Text(hospitalData?.phone??"",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: fontFamilyName,
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
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
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite_border_rounded,color: kWhiteColor,),
                  Text("أضف إلى المفضلة",
                    style: TextStyle(
                        fontFamily: fontFamilyName,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),),
                ],
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
    );
  }
}
