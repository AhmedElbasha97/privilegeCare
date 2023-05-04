import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/doctors_screen.dart';
import 'package:privilegecare/Utils/colors.dart';

class HomeCellWidget extends StatelessWidget {
  const HomeCellWidget({Key? key, required this.title, required this.imageUrl}) : super(key: key);
 final String title;
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 30,
                    width:30,
                    child: Image.network(imageUrl,fit: BoxFit.fitWidth,),
                  ),SizedBox(width: 10,),
                  Text(title,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: kBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),

                ],
              ),
            ),
            Divider(
              color: kGrayColor,
              height: 1,
              thickness: 1,
              endIndent: 10,
              indent: 30,
            ),

          ],
        ),
      ),
    );
  }
}
