import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

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
          "Sign Up",
          style: TextStyle(
              fontFamily: "Inter",
              color: kWhiteColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SizedBox(
                    height: Get.height*0.13,
                    width: Get.width*0.5,
                    child: Image.asset("assets/images/logo.png",fit: BoxFit.fitHeight,),
                  ),
                ),
              ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.0),
                 child: Text("Enter Your Full Name",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),),
               ),
              const SizedBox(
                height: 1,
              ),
              Container(
                width: Get.width,
                height: Get.height*0.09,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: Get.height*0.07,
                        width: Get.width*0.28,
                        child: CustomInputField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onchange: (text){

                          },
                          labelText: "First",
                          controller:controller1,
                          validator:(text){},
                          hasGreenBorder: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: Get.height*0.07,
                        width: Get.width*0.28,
                        child: CustomInputField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onchange: (text){

                          },
                          labelText: "Middle",
                          controller:controller2,
                          validator:(text){},
                          hasGreenBorder: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: Get.height*0.07,
                        width: Get.width*0.28,
                        child: CustomInputField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onchange: (text){

                          },
                          labelText: "Last",
                          controller:controller3,
                          validator:(text){},
                          hasGreenBorder: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Enter Your Email",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: Get.height*0.07,
                  width: Get.width*0.95,
                  child: CustomInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    onchange: (text){
                    },
                    labelText: "omar.khaled20@yahoo.com",
                    controller:controller4,
                    validator:(text){},
                    hasGreenBorder: false,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Enter Your Phone Number",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: Get.height*0.07,
                  width: Get.width*0.95,
                  child: CustomInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onchange: (text){
                    },
                    labelText: "20",
                    controller:controller5,
                    validator:(text){},
                    hasGreenBorder: false,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Enter Your Password",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: Get.height*0.07,
                  width: Get.width*0.95,
                  child: CustomInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    onchange: (text){
                    },
                    labelText: "**********************",
                    controller:controller6,
                    validator:(text){},
                    hasGreenBorder: false,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Confirm Your Password",
                  style: TextStyle(
                      fontFamily: "Inter",
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: Get.height*0.07,
                  width: Get.width*0.95,
                  child: CustomInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    onchange: (text){
                    },
                    labelText: "**********************",
                    controller:controller6,
                    validator:(text){},
                    hasGreenBorder: false,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 70,
                  width: Get.width*0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kBlueColor
                  ),
                  child: const Center(
                    child:  Text("Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kGrayColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),),
                    SizedBox(width: 5,),
                    Text("Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kBlueColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),),

                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
