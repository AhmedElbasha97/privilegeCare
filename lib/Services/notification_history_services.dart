import 'package:privilegecare/Models/notification_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class NotificationHistoryServices {
  static ApiService api = ApiService();

  static Future<List<NotificationModel>?> getHospitalList(
      String memberId) async {
    List<NotificationModel>? notificationList = [];
    var data = await api.request(
        Services.notificationHistoryListEndPoint, "POST", queryParamters: {
      "member_id": memberId,
    });
    if (data != null) {
      for (var notification in data) {
        notificationList.add(NotificationModel.fromJson(notification));
      }
      return notificationList;
    }
    return null;
  }
  static Future<NotificationModel?> getHospitalDetails(
      String memberId,String notificationId) async {
    var data = await api.request(
        Services.notificationDetailsListEndPoint, "POST", queryParamters: {
      "member_id": memberId,
      "notification_id":notificationId
    });
    print(data.length);
    if (data != null) {
      return NotificationModel.fromJson(data[0]);
    }
    return null;
  }
}