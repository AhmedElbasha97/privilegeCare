import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/homeScreen/home_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kGreenColor,
        leading: IconButton(icon: const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,),onPressed: (){
          Get.back();
        },),
        centerTitle: true,
        title:  const Text(
          "Sign In",
          style: TextStyle(
              fontFamily: "Inter",
              color: kWhiteColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height*0.8,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              SizedBox(
                height: Get.height*0.13,
                width: Get.width*0.5,
                child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
              ),
              Container(
                height: Get.height*0.6,
                width: Get.width*0.8,
                decoration: BoxDecoration(
                  color: kLightGrayColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    const Text("Hello",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kBlackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                    const Text("Sign into your account",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kGrayColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        child: CustomInputField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onchange: (text){

                          },
                          labelText: "Email",
                          controller:email,
                          validator:(text){},
                           hasGreenBorder: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        child: CustomInputField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onchange: (text){

                          },
                          labelText: "Password",
                          controller:password,
                          validator:(text){},
                           hasGreenBorder: true,
                          icon: const Icon(
                                 Icons.visibility_outlined,
                            color: kGrayColor,
                          ),
                        ),
                      ),
                    ),
                    const Text("Forget Your Password",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kBlackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),),
                    InkWell(
                      onTap: (){
                        Get.to(HomeScreen());
                      },
                      child: Container(
                        height: 60,
                        width: Get.width*0.6,
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
                                fontSize: 22),),
                        ),
                      ),
                    ),
                    const Text("Or Login using social media",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),),
                    SizedBox(
                      height: 30,
                      child: Image.asset("assets/images/socialMedia.png",fit: BoxFit.fitHeight,),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
