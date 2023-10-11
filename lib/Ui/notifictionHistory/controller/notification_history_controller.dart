import 'package:get/get.dart';
import 'package:privilegecare/Models/notification_model.dart';
import 'package:privilegecare/Services/notification_history_services.dart';
import 'package:privilegecare/Utils/memory.dart';

class NotificationHistoryController extends GetxController{
  late List<NotificationModel>? notificationsData;
  bool isLoading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  getData() async {
    notificationsData = await NotificationHistoryServices.getHospitalList(Get
        .find<StorageService>()
        .getId);
      isLoading = false;
    update();
  }
}