// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Services/biomatrics_auth_services.dart';
import 'package:privilegecare/Ui/changePassword/change_password_screen.dart';
import 'package:privilegecare/Ui/favorite/favorite_screen.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/profileScreen/controller/profile_controller.dart';
import 'package:privilegecare/Ui/profileScreen/widget/profile_cell_widget.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Ui/underConstruction/under_construction_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  decideWhichScreenToOpen(int index) async {
    switch(index) {
      case 0:{

      }
        break;
      case 1:{

      }
        break;
      case 2:{

      }
        break;
      case 3:{
        goToChangePass();
      }
        break;
      case 4:{
        Get.to(()=>const FavoriteScreen());
      }
        break;
      case 5:{

      }
        break;
      case 6:{

      }
        break;
      case 7:{

      }
        break;

    }

  }
  goToChangePass() async {
    if(await BiomatricsAuthService.authenticateUser()) {
    Get.to(() => const ChangePasswordScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => Scaffold(
          bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 0,),
          body:controller.userIsSigned? SizedBox(
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
                Container(
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
                const SizedBox(height: 10),
                const Text("الاسم",
                  style: TextStyle(
                      height: 1,
                      fontFamily: fontFamilyName,
                      color: kBlueColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child:Container(
                    height: Get.height*0.54,
                    width: Get.width*0.9,
                    child: ListView.builder(
                      itemCount: controller.icons.length,

                      itemBuilder: (_,index){
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: (){
                              decideWhichScreenToOpen( index);
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
            height: Get.height*0.8,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Sign in-pana.png",height: Get.width*0.65,),
                  const Text("يجب تسجيل دخولك او انشاء حساب ليصبح لك صفحه شخصية وتفعيل بعض المزايا",style: TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
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
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [const Text(
                                    "إنشاء حساب",
                                    style: TextStyle(
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
                                children:  [const Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
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
    );
  }
}
