import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/notifictionHistory/controller/notification_history_controller.dart';
import 'package:privilegecare/Ui/notifictionHistory/widget/notification_cell.dart';
import 'package:privilegecare/Ui/notifictionHistory/widget/notification_loader.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class NotificationHistory extends StatelessWidget {
  const NotificationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationHistoryController>(
      init: NotificationHistoryController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();

          },),
          centerTitle: true,
          title: CustomText(
            Get.find<StorageService>().activeLocale == SupportedLocales.english?"Notification list":"قيمة الاشعرات",
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),



        ),
        body: controller.isLoading?const NotificationLoader(): controller.notificationsData?.length==0?
        Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/icon/img.png"),
              ),
              SizedBox(height: 20,),
              Text(Localizations.localeOf(context).languageCode == "en"
                  ?"no Notification available":"لا يوجد اشعرات متوفره لان",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20

                ),),
            ],
          ),
        ):ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.notificationsData?.length,
            itemBuilder: (context, int index) {
              return  NotificationCell(notificationData: controller.notificationsData?[index],);
            }),
      ),
    );
  }
}
