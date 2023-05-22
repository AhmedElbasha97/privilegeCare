// ignore_for_file: unnecessary_import, sized_box_for_whitespace

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';

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

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height*0.1),
          child: AnimatedContainer(
            height: _isAppbar ?  Get.height*0.09 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: AppBar(

              actions: [
                IconButton(icon: const Icon(Icons.search_outlined,color: kBlueColor,size: 35,),onPressed: (){
                },),
                IconButton(icon: const Icon(Icons.notifications_none,color: kBlueColor,size: 35,),onPressed: (){
                },),],
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
        body: RawScrollbar(
          thumbColor: kBlueColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily:fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                          ),
                          const Text("دكتور احمد حسن",

                            style: TextStyle(
                                height: 1,
                                fontFamily:fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                          const SizedBox(height: 5,),
                          const Text("استشاري مخ وأعصاب",
                            style: TextStyle(
                                height: 1,
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),),
                        ],
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
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIdx){
                      return Image.asset('assets/images/Component 1 – 1.png',fit: BoxFit.fitWidth,);
                    },
                    options: CarouselOptions(
                        height: Get.height*0.19,
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        autoPlay: true),
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
                    height: Get.height*0.77,
                    width: Get.width*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kBlueColor,width: 1),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width:Get.width*0.8,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "مستشفى النيل \n نبذه عن مسشفى",

                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),),
                                Text("عرض التفاصيل",

                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIdx){
                              return Image.asset('assets/images/doctor banner home.png',fit: BoxFit.fitWidth,);
                            },
                            options: CarouselOptions(
                                height: Get.height*0.19,
                                aspectRatio: 2.0,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                autoPlay: true),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width:Get.width*0.8,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "مستشفى النيل \n نبذه عن مسشفى",

                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),),
                                Text("عرض التفاصيل",
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily:fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIdx){
                              return Image.asset('assets/images/doctor banner home.png',fit: BoxFit.fitWidth,);
                            },
                            options: CarouselOptions(
                                height: Get.height*0.19,
                                aspectRatio: 2.0,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                autoPlay: true),
                          ),
                          const SizedBox(height: 10,),
                          const Divider(
                            color: kGreenColor,
                            height: 1,
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                          const SizedBox(height: 10),
                          CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIdx){
                              return Image.asset('assets/images/Component 1 – 1.png',fit: BoxFit.fitWidth,);
                            },
                            options: CarouselOptions(
                                height: Get.height*0.19,
                                aspectRatio: 2.0,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                autoPlay: true),
                          ),
                          const SizedBox(height: 10,),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
