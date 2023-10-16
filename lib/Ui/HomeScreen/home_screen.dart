// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/controller/home_controller.dart';
import 'package:privilegecare/Ui/HomeScreen/widget/doctor_home_widget.dart';
import 'package:privilegecare/Ui/HomeScreen/widget/hospitals_banners_widget.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Ui/doctorsScreen/controller/doctor_list_controller.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Ui/helpScreen/help_screen.dart';
import 'package:privilegecare/Ui/hospital%20screen/hospitals_screen.dart';
import 'package:privilegecare/Ui/hospitalDetailed/hospital_detailed_screen.dart';
import 'package:privilegecare/Ui/notifictionHistory/notification_history_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
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
                    Get.to(()=>const NotificationHistory());
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
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: CustomText('Tap back again to leave'),
            ),
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
                      //1st carousel slider
                      controller.slideShowLoading?Loader(width: MediaQuery.of(context).size.width,height: 150.0):
                      CarouselSlider(
                        options:  CarouselOptions(
                            height: Get.height*0.19,
                            aspectRatio: 2.0,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlay: true),

                        items: controller.secondSliderData?.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return  InkWell(
                                onTap: (){
                                  controller.launchURL(context,i.link??"");
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "${Services.baseUrl}${i.image}",
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
                      //gridView of the doctors
                      controller.doctorData?.length ==0 ?const SizedBox():
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: controller.doctorData!.length-1 < 3?controller.doctorData?.length??0-1:3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 8.0,
                            childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 1.8),
                          ),

                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.doctorData?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DoctorHomeWidget(doctorData: controller.doctorData?[index],);
                          },

                      ),

                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          bool test4 = Get.isRegistered<DoctorListController>();
                          if(test4){
                            Get.delete<DoctorListController>();
                          }
                          Get.to(()=>const DoctorScreen(specialistId: "0"));
                        },
                        child:  CustomText(showMoreDoctorsHome.tr,
                          style: const TextStyle(
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
                                  fit: BoxFit.fitHeight,
                                  imageUrl: "${Services.baseUrl}${i.image}",
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
                                  CustomText(noHospAvailableHome.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ):Column(
                            children: controller.hospitalBanner!.map((e){
                              return  HospitalsBannersWidget(hospitalBanner: e,);
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
