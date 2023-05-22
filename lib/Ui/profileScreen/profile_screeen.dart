// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/profileScreen/widget/profile_cell_widget.dart';
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
  List<String> icons = [
    "updateProfileIcon",
    "medicalInsuranceIcon",
    "creditCardIcon",
    "helpIcon",
    "changePasswordIcon",
    "favoriteIcon",
    "settingsIcon",
    "termsIcon",
    "privilegeIcon",
    "evaluationIcon",
    "signOutIcon"
  ];
  List<String> title =[
    "تحديث الملف الشخصي",
    "تأمين طبي",
    "بطاقات الائتمان",
    "يساعد",
    "تغيير كلمة المرور",
    "مفضل",
    "إعدادات",
    "الأحكام والشروط",
    "نقاط رعاية الامتياز",
    "تقييم التطبيق",
    "خروج",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 0,),
        body: SizedBox(
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
                    itemCount: icons.length,

                    itemBuilder: (_,index){
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(const UnderConstructionScreen());
                          },
                            child: ProfileCellWidget(profileTextTap: title[index], profileIcon: "assets/icons/${icons[index]}.png",)),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
