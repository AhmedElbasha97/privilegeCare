import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/HomeScreen/controller/home_controller.dart';
import 'package:privilegecare/Ui/notifictionHistory/notification_history_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/memory.dart';

class NotificationIcon extends StatefulWidget {
   NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  int counter = Get.find<StorageService>().getNotificationCounter;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
        ),
        Positioned(
          right: 5,
          top: 5,
          child: IconButton(icon: const Icon(Icons.notifications_none,color: kBlueColor,size: 35), onPressed: () {
             Get.find<StorageService>().saveNotificationCounter(0);
             counter = Get.find<StorageService>().getNotificationCounter;
             setState(() {

             });
             Get.find<HomeController>().update();
            Get.to(()=>const NotificationHistory());
          }),
        ),
        counter != 0 ?  Positioned(
          right: 11,
          top:13,
          child:  Container(
            padding: const EdgeInsets.all(2),
            decoration:  BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '$counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) :  Container()
      ],
    );
  }
}
