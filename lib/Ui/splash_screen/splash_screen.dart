// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/SpecialtyScreen/specialty_screen.dart';
import 'package:privilegecare/Ui/welcomeScreen/welcome_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/memory.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if(Get.find<StorageService>().checkUserIsSignedIn){
        Get.to(SpecialtyScreen());
      }else{
        Get.to(const WelcomeScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
       height: Get.height,
        width: Get.width,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kGreenColor, kLightBlueColor, kBlueColor],
            stops: [0.1, 0.5, 0.9],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: Get.height*0.25,
            width: Get.width*0.5,
            child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
          ),
        ),
      ),
    );
  }
}
