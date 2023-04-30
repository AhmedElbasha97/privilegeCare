import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';

class DoctorDetailedScreen extends StatelessWidget {
   DoctorDetailedScreen({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        leadingWidth: 100,
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: kBlueColor,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.share,
                    color: kBlueColor,
                  ),
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
        title:  const Text(
          "بيانات الدكتور",
          style: TextStyle(
              fontFamily: "Inter",
              color: kWhiteColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
        ],
      ),
      backgroundColor: kLightGrayColor,
      body: RawScrollbar(
        thumbColor: kBlueColor,
        radius: const Radius.circular(20),
        thickness: 5,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
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
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                      ),SizedBox(
                                        height: 15,
                                        width: 15,
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
                                height: 80,
                                width: 80,
                                child: Image.asset("assets/images/doctor.png",fit: BoxFit.fitWidth,),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("20 دقيقة",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kGreenColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),
                                    Text("وقت الانتظار",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),

                                  ],
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
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("300 جنيه",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),
                                    Text("سعر الكشف",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),

                                  ],
                                ),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  height: 25,
                                  width: 23,
                                  child: Image.asset("assets/images/cash.png",fit: BoxFit.fitHeight,),
                                ),
                              ],
                            ),





                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("المهندسين :شارع جزيرة العرب",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),
                                    Text("احجز وسيصلك تفاصيل العنوان",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),

                                  ],
                                ),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  height: 25,
                                  width: 17,
                                  child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                                ),
                              ],
                            ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        const SizedBox(height: 10,),
                       const Center(
                         child:  Text("اختر ميعاد حجزك",
                           style: TextStyle(
                               fontFamily: "Inter",
                               color: kBlueColor,
                               fontWeight: FontWeight.w700,
                               fontSize: 17),),
                       ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(icon: const Icon(Icons.arrow_circle_left_outlined,color: kBlueColor,size: 40,),onPressed: (){
                            },),
                            const SizedBox(width: 10,),
                            Container(
                              height: 130,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBlueColor,width: 1.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 30,
                                    color: kBlueColor,
                                    child: const Center(
                                      child: Text("الأثنين 03/27",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("8:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("إلى",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("11:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    width: 80,
                                    height: 27,
                                    color: kBlueColor,
                                    child: const Center(
                                      child: Text("احجز",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),),
                                    ),
                                  ),
                                ],
                              ),
                            ),const SizedBox(width: 10,),
                            Container(
                              height: 130,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBlueColor,width: 1.0),
                              ),
                              child: Column(
                                children: [
                                 Container(
                                   width: 80,
                                   height: 30,
                                   color: kBlueColor,
                                   child: const Center(
                                     child: Text("الأثنين 03/27",
                                       style: TextStyle(
                                           fontFamily: "Inter",
                                           color: Colors.white,
                                           fontWeight: FontWeight.w700,
                                           fontSize: 10),),
                                   ),
                                 ),
                                  const SizedBox(height: 5,),
                                  const Text("8:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("إلى",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("11:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    width: 80,
                                    height: 27,
                                    color: kGreenColor,
                                    child: const Center(
                                      child: Text("احجز",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              height: 130,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBlueColor,width: 1.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 30,
                                    color: kBlueColor,
                                    child: const Center(
                                      child: Text("الأثنين 03/27",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("8:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("إلى",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  const Text("11:00م",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    width: 80,
                                    height: 27,
                                    color: kBlueColor,
                                    child: const Center(
                                      child: Text("احجز",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10,),
                            IconButton(icon: const Icon(Icons.arrow_circle_right_outlined,color: kBlueColor,size: 40,),onPressed: (){
                            },),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Center(
                          child:  Text("الدخول بأسبقية الحضور",
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: kBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("ستحصل علي 400 نقطة عند الحجز",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),

                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    height: 25,
                                    width: 27,
                                    child: Image.asset("assets/images/pouns.png",fit: BoxFit.fitHeight,),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Row(
                                children: [
                                  const Text("5/4.5 تقييم العيادة",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),),
                                  const SizedBox(width: 5,),
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitHeight,),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("5/4.5 تقييم المساعد",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),),
                                  const SizedBox(width: 5,),
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset("assets/images/Star.png",fit: BoxFit.fitHeight,),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("العيادة",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),
                                      Text("صالة انتظار مريحة",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),

                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    height: 25,
                                    width: 27,
                                    child: Image.asset("assets/images/waitingStatuss.png",fit: BoxFit.fitHeight,),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
                                      const Text("معلومات عن الدكتور",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),
                                      Container(
                                        width: Get.width*0.7,
                                        child: const Text("أخصائي طب و جراحة الفم و الاسنان كلية طب أسنان  جامعة أكتوبر",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              color: kGreenColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    height: 25,
                                    width: 27,
                                    child: Image.asset("assets/images/doctor info.png",fit: BoxFit.fitHeight,),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
                                      const Text("التخصصات الفرعية",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),
                                      Container(
                                        width: Get.width*0.7,
                                        child: const Text("أخصائي طب و جراحة الفم و الاسنان كلية طب أسنان - جامعة أكتوبر",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              color: kGreenColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  const SizedBox(
                                    height: 25,
                                    width: 27,

                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
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
                              Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("أسئلة وإجابات الدكتور",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            color: kBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),),

                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  const SizedBox(
                                    height: 25,
                                    width: 27,
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
                child: SizedBox(

                  width: Get.width,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        const SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(0,0,30,0),
                            child: Text("تقييمات الزائرين",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: const Text("التقييمات من 185 زائر",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter",
                                color: kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          height: Get.height*0.08,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: Get.width*0.4,
                                height: Get.height*0.08,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kBlueColor,width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),

                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children:  [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    const Text("تقييم الدكتور",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),



                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width*0.4,
                                height: Get.height*0.08,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kBlueColor,width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white
                                ),
                                
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children:  [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    const Text("التقييم العام",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: kBlueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),),



                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                const Text("التقييم العام",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),),
                                const SizedBox(width: 20,),

                              ],
                            ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: Get.width*0.9,
                                  child: const Text("دكتور قمة فى التواضع والأخلاق وسامعني للاخر ورد علي كل أسئلتي وطمني \nهالة  15 مارس 2023",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Divider(
                                color: kBlueColor,
                                height: 1,
                                thickness: 1,
                                endIndent: 30,
                                indent: 10,
                              ),
                              const SizedBox(height: 30,),

                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/Star.png",fit: BoxFit.fitWidth,),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                const Text("التقييم العام",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),),
                                const SizedBox(width: 20,),

                              ],
                            ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: Get.width*0.9,
                                  child: const Text("دكتور قمة فى التواضع والأخلاق وسامعني للاخر ورد علي كل أسئلتي وطمني \nهالة  15 مارس 2023",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: kBlueColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Divider(
                                color: kBlueColor,
                                height: 1,
                                thickness: 1,
                                endIndent: 30,
                                indent: 10,
                              ),
                              const SizedBox(height: 30,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
