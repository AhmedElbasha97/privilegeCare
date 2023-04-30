import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/logInScreen/login_screen.dart';
import 'package:privilegecare/Ui/signUpScreen/signup_screen.dart';
import 'package:privilegecare/Utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height*0.25,
              width: Get.width*0.5,
              child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
            ),
            Column(
              children: const [
                Text("Welcome",
                  style: TextStyle(

                      fontFamily: "Inter",
                      color: kBlueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),),
                Text("Here We Can Help you save your time \n while asking for a medical help",
                  textAlign: TextAlign.center,
                  style: TextStyle(

                      fontFamily: "Inter",
                      color: kBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),),
              ],
            ),
            Container(
              width: Get.width,
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:(){
                    Get.to(LoginScreen());
                  },
                  child: Container(
                    height: 70,
                    width: Get.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kBlueColor
                    ),
                    child: const Center(
                      child:  Text("Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(SignUpScreen());
                  },
                  child: Container(
                    height: 70,
                    width: Get.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kBlueColor
                    ),
                    child: const Center(
                      child:  Text("Register Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
