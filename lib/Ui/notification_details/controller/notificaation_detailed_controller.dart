// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/notification_model.dart';
import 'package:privilegecare/Services/notification_history_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class NotificationDetailedController extends GetxController{
  late NotificationModel? notificationsData;

  final String notificationId;
  bool isLoading = true;

  NotificationDetailedController(this.notificationId);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<NotificationDetailedController>();
  }
  getData() async {
    notificationsData = await NotificationHistoryServices.getHospitalDetails(Get
        .find<StorageService>()
        .getId, notificationId);
    print(notificationsData);
     isLoading = false;
    update();
  }
  String returnDateAndTime(String? chat){
    String dateOrTime = "" ;
    final format = DateFormat('HH:mm a');
    DateFormat formatDate = DateFormat("hh:mm:ss yyyy-MMM-dd");
    final dateTime = DateTime.parse(chat??"");
    if(dateTime.day == DateTime.now().day){
      dateOrTime = format.format(dateTime);
    }else{
      dateOrTime = formatDate.format(dateTime);
    }
    return dateOrTime;
  }
}