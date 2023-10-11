// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/profileScreen/controller/profile_controller.dart';
import 'package:privilegecare/Ui/profileScreen/widget/profile_cell_widget.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) =>SizedBox.expand(
          child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Get.to(()=> SpecialtyScreen());
              }
            },
            child: Scaffold(
              bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 0,),
              body:DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: CustomText('Tap back again to leave'),
                ),
                child: controller.userIsSigned?controller.isLoading?const Loader(): SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: Get.height*0.12,
                        width: Get.width*0.5,
                        child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                      ),
                      Row(

                        children: [
                          SizedBox(width: Get.width*0.2,),
                          controller.data?.image==""?InkWell(
                            onTap: (){
                              controller.choosePhotoSource(context);
                            },
                            child: Container(
                              height: Get.height*0.12,
                              width: Get.width*0.2,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(color: kBlueColor,width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: Get.height*0.12,
                                width: Get.width*0.2,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  border: Border.all(color: kGreenColor,width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    height: Get.height*0.12,
                                    width: Get.width*0.2,
                                    decoration: BoxDecoration(
                                      color: kBlueColor,

                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  child: const Center(
                                    child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                          ):InkWell(
                            onTap: (){
                              controller.choosePhotoSource(context);
                            },
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: "${Services.baseUrl}${controller.data?.image??""}",
                              imageBuilder: ((context, image){
                                return  Container(
                                  height: Get.height*0.12,
                                  width: Get.width*0.2,
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kBlueColor,width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: Get.height*0.12,
                                    width: Get.width*0.2,
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreenColor,width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      height: Get.height*0.12,
                                      width: Get.width*0.2,
                                      decoration: BoxDecoration(
                                        color: kBlueColor,
                                        image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.cover,
                                      ),

                                        borderRadius: BorderRadius.circular(15),
                                      ),

                                      ),
                                    ),
                                  );

                              }),
                              placeholder: (context, image){
                                return  Container(
                                  height: Get.height*0.12,
                                  width: Get.width*0.2,
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kBlueColor,width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: Get.height*0.12,
                                    width: Get.width*0.2,
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreenColor,width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      height: Get.height*0.12,
                                      width: Get.width*0.2,
                                      decoration: BoxDecoration(
                                        color: kBlueColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                        child:const Center(child: CircularProgressIndicator(color: kBlueColor,))
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error){
                                return Container(
                                  height: Get.height*0.12,
                                  width: Get.width*0.2,
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kBlueColor,width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: Get.height*0.12,
                                    width: Get.width*0.2,
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreenColor,width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      height: Get.height*0.12,
                                      width: Get.width*0.2,
                                      decoration: BoxDecoration(
                                        color: kBlueColor,

                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height*0.025,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.person,size: 18,color: kBlueColor,),
                                    CustomText(controller.data?.name??"",
                                      style: const TextStyle(

                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15),),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: Get.height*0.025,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    const Icon(Icons.phone,size: 18,color: kBlueColor,),
                                    CustomText("${
                                        controller.data?.phone??0
                                    }",
                                      style: const TextStyle(

                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15),),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: Get.height*0.025,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.email,size: 18,color: kBlueColor,),
                                    CustomText(controller.data?.email??"",
                                      style: const TextStyle(

                                          fontFamily: fontFamilyName,
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15),),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:Container(
                          height: Get.height-(kBottomNavigationBarHeight+Get.height*0.36),
                          width: Get.width*0.9,
                          child: ListView.builder(
                            itemCount: controller.icons.length,

                            itemBuilder: (_,index){
                              return  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: InkWell(
                                  onTap: (){
                                    controller.decideWhichScreenToOpen(index,context);
                                  },
                                    child: ProfileCellWidget(profileTextTap: controller.title[index], profileIcon: "assets/icons/${controller.icons[index]}.png",)),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ):SizedBox(
                  height: Get.height-kBottomNavigationBarHeight,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Sign in-pana.png",height: Get.width*0.65,),
                        CustomText(notRegisterUserProfile.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
                        const SizedBox(height: 30,),
                        Column(
                          children: [
                            InkWell(
                              onTap: (){Get.to(()=>const SignUpScreen());},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kBlueColor,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [ CustomText(
                                          signUpProfile.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color:kBlueColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20)
                                      ),
                                        const SizedBox(width: 10,),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset("assets/icons/signupicon.png",fit: BoxFit.fitHeight,),
                                        ),
                                      ],

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){Get.to(()=>const LoginScreen());},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kBlueColor,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [ CustomText(
                                          signInProfile.tr,
                                          style: const TextStyle(
                                              fontFamily: fontFamilyName,
                                              color:kBlueColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20)
                                      ),
                                        const SizedBox(width: 10,),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset("assets/icons/loginIcon.png",fit: BoxFit.fitHeight,),
                                        ),
                                      ],

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
