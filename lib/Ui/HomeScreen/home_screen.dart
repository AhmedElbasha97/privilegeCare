// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/controller/home_controller.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Ui/helpScreen/help_screen.dart';
import 'package:privilegecare/Ui/hospital%20screen/hospitals_screen.dart';
import 'package:privilegecare/Ui/hospitalDetailed/hospital_detailed_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAppbar = true;
  final ScrollController _scrollController =  ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        appBarStatus(true);
      }
    });
  }

  void appBarStatus(bool status) {
    setState(() {
      _isAppbar = status;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height*0.1),
            child: AnimatedContainer(
              height: _isAppbar ?  Get.height*0.09 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                leading: IconButton(icon: const Icon(Icons.info_outline,color: kBlueColor,size: 35,),onPressed: (){
                  Get.to(()=>const HelpScreen());
                },),
                actions: [
                  IconButton(icon: const Icon(Icons.search_outlined,color: kBlueColor,size: 35,),onPressed: (){
                    
                      Get.to(()=>const DoctorScreen(specialistId: "0"));

                  },),
                  IconButton(icon: const Icon(Icons.notifications_none,color: kBlueColor,size: 35,),onPressed: (){
                  },),
                  ],
                backgroundColor: Colors.white,
                toolbarHeight: Get.height*0.1,
                flexibleSpace: SizedBox(
                  height: Get.height*0.1,
                  width: Get.width*0.3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,10.0,0,5),
                    child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitHeight,),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 2,),
          backgroundColor: kWhiteColor,
          body: SizedBox.expand(
            child: GestureDetector(
            onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Get.to(()=>const HospitalScreens());
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Get.to(()=>SpecialtyScreen());
            }
            },
            child: RawScrollbar(
              thumbColor: kBlueColor,
              radius: const Radius.circular(20),
              thickness: 5,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      controller.slideShowLoading?Loader(width: MediaQuery.of(context).size.width,height: 150.0):
                      CarouselSlider(
                        options:  CarouselOptions(
                            height: Get.height*0.19,
                            aspectRatio: 2.0,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlay: true),

                        items: controller.sliderData?.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return  InkWell(
                                onTap: (){
                                  controller.launchURL(context,i.link??"");
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${i.image}",
                                  imageBuilder: ((context, image){
                                    return  Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image,
                                              fit: BoxFit.fill,
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
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18,),
                      controller.isLoading?const SizedBox():Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          controller.doctorData!.length < 0?const SizedBox():InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[0].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[0].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[0].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text( controller.doctorData?[0].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                          controller.doctorData!.length < 1?const SizedBox():
                          InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[1].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[1].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[1].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text(controller.doctorData?[1].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                          controller.doctorData!.length < 2?const SizedBox():
                          InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[2].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[2].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[2].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text(controller.doctorData?[2].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      controller.isLoading?const SizedBox():Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          controller.doctorData!.length < 3?const SizedBox():
                          InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[3].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[3].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[3].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily:fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text(controller.doctorData?[3].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                          controller.doctorData!.length < 4?const SizedBox():
                          InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[4].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[4].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[4].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text(controller.doctorData?[4].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                          controller.doctorData!.length < 5?const SizedBox():
                          InkWell(
                            onTap: (){
                              Get.to(DoctorDetailedScreen(doctorId: "${controller.doctorData?[5].id??0}"));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${controller.doctorData?[4].image??""}",
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
                                const SizedBox(height: 5),
                                 Text( controller.doctorData?[5].name??"",

                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily:fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                 Text(controller.doctorData?[5].specialist??"",
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      InkWell(
                        onTap: (){
                          Get.to(()=>const DoctorScreen(specialistId: "5"));
                        },
                        child: const Text("عرض المزيد من الأطباء",
                          style: TextStyle(
                              height: 1,
                              fontFamily: fontFamilyName,
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),),
                      ),
                      const SizedBox(height: 18,),
                      controller.slideShowLoading?Loader(width: MediaQuery.of(context).size.width,height: 150.0):
                      CarouselSlider(
                        options:  CarouselOptions(
                          height: Get.height*0.19,
                          aspectRatio: 2.0,
                          enlargeCenterPage: false,
                          viewportFraction: 1,
                          autoPlay: true),

                        items: controller.sliderData?.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return  InkWell(
                                onTap: (){
                                  controller.launchURL(context,i.link??"");
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://privilegecare.net${i.image}",
                                  imageBuilder: ((context, image){
                                    return  Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image,
                                              fit: BoxFit.fill,
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
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10,),
                      const Divider(
                        color: kGreenColor,
                        height: 1,
                        thickness: 1,
                        endIndent: 20,
                        indent: 20,
                      ),
                      const SizedBox(height: 20,),
                      Container(

                        width: Get.width*0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kBlueColor,width: 1),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: controller.hospitalSlideShowLoading?Loader(width: MediaQuery.of(context).size.width,height: 150.0):controller.hospitalBanner?.length==0?Center(
                            child: Container(
                              height: 130,
                              width: Get.width*0.75,
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Hospital building-rafiki.png",height: Get.width*0.23,),
                                  const Text("ليس هناك فيديو متاح الان",style: TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ):Column(
                            children: controller.hospitalBanner!.map((e){
                              return  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: InkWell(
                                  onTap: (){
                                    Get.to(()=>HospitalDetailedScreen(hospitalId: "${e.id}"));
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
                                                Text(
                                                  Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn:e.name,

                                                  style: const TextStyle(
                                                      height: 1,
                                                      fontFamily: fontFamilyName,
                                                      color: kBlueColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 15),),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  " نبذه عن مسشفى",

                                                  style: TextStyle(
                                                      height: 1,
                                                      fontFamily: fontFamilyName,
                                                      color: kBlueColor,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15),),
                                              ],
                                            ),
                                            const Text("عرض التفاصيل",

                                              style: TextStyle(
                                                  height: 1,
                                                  fontFamily: fontFamilyName,
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      e.image?.length==0?Container(
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

                                        items: e.image?.map((i) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return  CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: "https://privilegecare.net$i",
                                                imageBuilder: ((context, image){
                                                  return  Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: image,
                                                            fit: BoxFit.fill,
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
                                      SizedBox(height: 15,),
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
                            }).toList()
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}
