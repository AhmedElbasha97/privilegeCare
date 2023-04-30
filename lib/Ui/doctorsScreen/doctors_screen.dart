import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Utils/colors.dart';

class DoctorScreen extends StatelessWidget {
   DoctorScreen({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RawScrollbar(
          thumbColor: kBlueColor,
          radius: const Radius.circular(20),
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
                  height: Get.height*0.085,
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
                    children:  [
                      Column(
                        children:  [
                          const Text("تبحث في ",
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: kWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,

                            ),

                          ),
                          Container(
                            color: kDarkBlueColor,
                            child: Row(
                              children: const [

                                Icon(Icons.arrow_downward,color: kWhiteColor,),
                                Text("كل المناطق ",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 90,),
                      const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: kWhiteColor,
                        size: 40,),
                      const SizedBox(width: 5,)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
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
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width*0.3,
                          height: Get.height*0.05,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("التصفية ",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),),
                              const Icon(
                                Icons.filter_alt,
                                color: kWhiteColor,
                                size: 25,),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.3,
                          height: Get.height*0.05,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("الخريطة ",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),),
                              Icon(
                                Icons.map_outlined,
                                color: kWhiteColor,
                                size: 15,),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width*0.3,
                          height: Get.height*0.05,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("الترتيب ",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),),
                              Icon(
                                Icons.mobiledata_off_rounded,
                                color: kWhiteColor,
                                size: 25,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height*0.7,
                  color: kLightGrayColor,
                  child: RawScrollbar(
                    thumbColor: kBlueColor,
                    radius: const Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      itemCount: 3,
                      controller: controller,
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: (){
                              Get.to( DoctorDetailedScreen());
                            },
                            child: SizedBox(

                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 6,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text("دكتور عمر خالد أبوبكر ",

                                              style: TextStyle(
                                                  height: 1,
                                                  fontFamily: "Inter",
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20),),
                                            const Text("أخصائي طب و جراحة الفم و الاسنان",
                                              style: TextStyle(
                                                  height: 1,
                                                  fontFamily: "Inter",
                                                  color: kGreenColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                                ),SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                                ),SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                                ),SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                                ),SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                                ),
                                              ],
                                            ),
                                            const Text("التقييم العام من 1000 زائر",
                                              style: TextStyle(
                                                  height: 1,
                                                  fontFamily: "Inter",
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),),

                                          ],
                                        ),
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              width: Get.width*0.35,
                                              height: Get.height*0.04,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
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
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text("مستمع جيد ",
                                                    style: TextStyle(
                                                        fontFamily: "Inter",
                                                        color: kBlueColor,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 15),),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset("assets/images/new patient.png",fit: BoxFit.fitWidth,),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              width: Get.width*0.35,
                                              height: Get.height*0.04,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    offset: Offset(0, 2),
                                                    blurRadius: 6,
                                                    color: Colors.black12,
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text("شرحه مفصل ",
                                                    style: TextStyle(
                                                        fontFamily: "Inter",
                                                        color: kBlueColor,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 15),),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset("assets/images/oldPatient.png",fit: BoxFit.fitWidth,),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                          width: Get.width*0.65,
                                          child: const Text("دكتور اسنان متخصص في تركيبات أسنان زراعة أسنان،تجميل أسنان ",
                                            style: TextStyle(
                                                fontFamily: "Inter",
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),

                                          const SizedBox(width: 10,),
                                          SizedBox(
                                            height: 25,
                                            width: 20,
                                            child: Image.asset("assets/images/specification.png",fit: BoxFit.fitHeight,),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                          width: Get.width*0.6,
                                          child: const Text("المهندسين :شارع جزيرة العرب",
                                            style: TextStyle(
                                                fontFamily: "Inter",
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),
                                          textAlign: TextAlign.end,
                                          ),

                                        ),
                                          const SizedBox(width: 10,),

                                          SizedBox(
                                            height: 25,
                                            width: 20,
                                            child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                                          ),

                                        ],
                                      ),Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text("الكشف :300 جنيه",
                                            style: TextStyle(
                                                fontFamily: "Inter",
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),),
                                          const SizedBox(width: 10,),
                                          SizedBox(
                                            height: 25,
                                            width: 23,
                                            child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                                          ),

                                        ],
                                      ),Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                          width: Get.width*0.45,
                                          child: const Text("مدة الأنتظار:20 دقيقة",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: "Inter",
                                                color: kGreenColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),),

                                        ),
                                          const SizedBox(width: 10,),

                                          SizedBox(
                                            height: 25,
                                            width: 27,
                                            child: Image.asset("assets/images/waitingtime.png",fit: BoxFit.fitHeight,),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: Get.width*0.18,
                                            child: const Text("16754 ",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  color: kBlueColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 17),),

                                          ),
                                          const SizedBox(width: 10,),

                                          SizedBox(
                                            height: 10,
                                            width: 27,
                                            child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: Get.width*0.28,
                                            height: Get.height*0.04,
                                            decoration: BoxDecoration(
                                              color: kGreenColor,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                            child: const Center(
                                              child: Text("احجز الأن",
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: kWhiteColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 17),),
                                            ),
                                          ),
                                        ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: Get.width*0.5,
                                              height: Get.height*0.04,
                                              decoration: BoxDecoration(
                                                color: kBlueColor,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    offset: Offset(0, 2),
                                                    blurRadius: 6,
                                                    color: Colors.black12,
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text("متاح اليوم من 4 م ",
                                                  style: TextStyle(
                                                      fontFamily: "Inter",
                                                      color: kWhiteColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 17),),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
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


            ),
          );

  }
}
