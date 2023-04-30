import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Utils/colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   final ScrollController controller = ScrollController();
   List<String> mostChoosenSpecialsTitle = ["جلدية","أسنان","نفسي","أطفال وحديثي الولادة","مخ وأعصاب","قلب و أوعية دموية","أنف وأذن وحنجرة","نساء وتواليد","عظام"];
   List<String> mostChoosenSpecialImages = ["assets/images/skin.png","assets/images/teeth.png","assets/images/syco.png","assets/images/baby.png","assets/images/mind.png","assets/images/heart.png","assets/images/nose.png","assets/images/her.png","assets/images/bone.png",];
   List<String> anotherSpecialTitle = ["جراحة عظام","جراحة عامة","امراض ذكورة"];
   List<String> anotherSpecialImage = ["assets/images/sergon.png","assets/images/boneSurgeon.png","assets/images/maledoctor.png"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RawScrollbar(
            thumbColor: kBlueColor,
            radius: Radius.circular(20),
            thickness: 5,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  height: Get.height*0.12,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: Get.height*0.12,
                        width: Get.width,
                        child: Image.asset("assets/images/doctorPanner.png",fit: BoxFit.fitWidth,),
                      ),
                      const Positioned(
                        left: 10,
                        top: 25,
                        child: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: kWhiteColor,
                          size: 40,
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        top: 25,
                        child: Icon(
                          Icons.arrow_circle_right_outlined,
                          color: kWhiteColor,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height*0.12,
                  width: Get.width*0.5,
                  child: Image.asset("assets/images/horizontalLogo.png",fit: BoxFit.fitWidth,),
                ),
                Container(
                  height: Get.height*0.06,
                  width: Get.width*0.95,
                  decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("ابحث عن دكتور",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kWhiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),),
                    SizedBox(width: 70,),
                    Icon(
                    Icons.arrow_circle_right_outlined,
                    color: kWhiteColor,
                    size: 40,),
                      SizedBox(width: 5,)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: Get.height*0.06,
                  width: Get.width*0.95,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border.all(color: kBlueColor,width: 1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("ابحث بالتخصص،اسم الدكتور،أو المستشفي",
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: kGrayColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),),
                    SizedBox(width: 15,),
                    Icon(
                    Icons.search_outlined,
                    color: kGrayColor,
                    size: 30,),
                      SizedBox(width: 5,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: Get.width,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                      children:  [
                        const Text("التخصصات الأكثر اختيارا",
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),),
                        Container(
                          width: Get.width*0.9,
                          height: Get.height*0.4,
                          child: RawScrollbar(
                            thumbColor: kBlueColor,
                            radius: Radius.circular(20),
                            thickness: 5,
                            child: ListView.builder(
                              itemCount: mostChoosenSpecialsTitle.length,
                              controller: controller,
                              itemBuilder: (_,index){
                                return InkWell(
                                  onTap: (){
                                    Get.to(DoctorScreen());
                                  },
                                  child: Container(
                                    height: Get.height*0.07,
                                    width: Get.width*0.8,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [

                                              Text(mostChoosenSpecialsTitle[index],
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: kBlueColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15),),
                                              SizedBox(width: 10,),
                                              SizedBox(
                                                height: 30,
                                                width:30,
                                                child: Image.asset(mostChoosenSpecialImages[index],fit: BoxFit.fitWidth,),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: kGrayColor,
                                          height: 1,
                                          thickness: 1,
                                          endIndent: 30,
                                          indent: 10,
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:  [
                        const Text("التخصصات الأخري",
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: kBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),),
                        Container(
                          width: Get.width*0.9,
                          height: Get.height*0.3,
                          child: RawScrollbar(
                            thumbColor: kBlueColor,
                            radius: Radius.circular(20),
                            thickness: 5,
                            child: ListView.builder(
                              itemCount: anotherSpecialTitle.length,
                              controller: controller,
                              itemBuilder: (_,index){
                                return Container(
                                  height: Get.height*0.07,
                                  width: Get.width*0.8,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Text(anotherSpecialTitle[index],
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),),
                                            SizedBox(width: 10,),
                                            SizedBox(
                                              height: 30,
                                              width:30,
                                              child: Image.asset(anotherSpecialImage[index],fit: BoxFit.fitWidth,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: kGrayColor,
                                        height: 1,
                                        thickness: 1,
                                        endIndent: 30,
                                        indent: 10,
                                      ),

                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
