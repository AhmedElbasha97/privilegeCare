// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/home_screen.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/hospital%20screen/hospitals_screen.dart';
import 'package:privilegecare/Ui/profileScreen/profile_screeen.dart';
import 'package:privilegecare/Ui/underConstruction/under_construction_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedTap;
  const BottomNavigationBarWidget({Key? key, required this.selectedTap}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override

  Widget build(BuildContext context) {
    int _selectedIndex = widget.selectedTap;
    return  FlashyTabBar(
      animationCurve: Curves.linear,
      selectedIndex: _selectedIndex,

      iconSize: 30,
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (index) {

        switch(index){
          case 0:{
            Get.off(()=> const ProfileScreen());
            setState(() {
              _selectedIndex = index;
            });
          }
          break;
          case 1:{

            Get.off(()=>SpecialtyScreen());
            setState(() {
              _selectedIndex = index;
            });
          }
          break;
          case 2:{
            Get.off(()=> const HomeScreen());
            setState(() {
              _selectedIndex = index;
            });
          }
          break;
          case 3:{
            Get.off(()=> const HospitalScreens());
            setState(() {
              _selectedIndex = index;
            });
          }
          break;
          case 4:{
            Get.to(()=> const UnderConstructionScreen());
            setState(() {
              _selectedIndex = index;
            });
          }
          break;
        }

        },
      items: [
        FlashyTabBarItem(
          activeColor: kBlueColor,
          icon: Image.asset(
            "assets/icons/profileIcon.png",
              width: 30,
            ),
          title: const Text('الحساب الشخصى',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kGreenColor,
                height: 1,
                fontWeight: FontWeight.w500,

                fontSize: 13),),
        ),
        FlashyTabBarItem(
          activeColor: kBlueColor,
          icon: Image.asset(
            "assets/icons/doctorIcon.png",
            width: 30,
          ),
          title: const Text('الأطباء',
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kGreenColor,
                fontWeight: FontWeight.w700,
                fontSize: 13),),
        ),
        FlashyTabBarItem(
          activeColor: kBlueColor,
          icon: Image.asset(
            "assets/icons/homeIcon.png",
            width: 30,
          ),
          title: const Text('الصفحة الرئيسية',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kGreenColor,
                height: 1,
                fontWeight: FontWeight.w600,
                fontSize: 13),),
        ),FlashyTabBarItem(
          activeColor: kBlueColor,
          icon: Image.asset(
            "assets/icons/hospitalIcons.png",
            width: 30,
          ),
          title: const Text('مستشفى',
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kGreenColor,
                fontWeight: FontWeight.w700,
                fontSize: 13),),
        ),
        FlashyTabBarItem(
          activeColor: kBlueColor,
          icon: Image.asset(
            "assets/icons/settingsIcons.png",
            width: 30,
          ),
          title: const Text('الأعدادات',
            style: TextStyle(
                fontFamily: fontFamilyName,
                color: kGreenColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),),
        ),

      ],
    );

  }
}
