import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/notification_model.dart';
import 'package:privilegecare/Ui/notification_details/notification_details_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class NotificationCell extends StatelessWidget {
  const NotificationCell({Key? key, this.notificationData}) : super(key: key);
  final NotificationModel? notificationData;
  String returnDateAndTime(String? chat){
    String dateOrTime = "" ;
    final format = DateFormat('HH:mm a');
    DateFormat formatDate = DateFormat("MMM dd");
    final dateTime = DateTime.parse(chat??"");
    if(dateTime.day == DateTime.now().day){
      dateOrTime = format.format(dateTime);
    }else{
      dateOrTime = formatDate.format(dateTime);
    }
    return dateOrTime;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>NotificationDetailsScreen(notificationId: "${notificationData?.id??0}",));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade500,width: 1)
            )
        ),
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    border: Border.all(color: kBlueColor,width: 1),
                    shape: BoxShape.circle
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreenColor,width: 1),
                    shape: BoxShape.circle
                  ),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                        "assets/images/logo.png"
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            notificationData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                            maxLines: null,
                          ),
                          CustomText(
                            returnDateAndTime(notificationData?.date??""),

                            style: const TextStyle(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                            maxLines: null,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Opacity(
                        opacity: 0.64,
                        child: CustomText(
                          notificationData?.desc??"",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
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
