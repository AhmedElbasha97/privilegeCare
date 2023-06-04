import 'package:privilegecare/Models/history_data_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HistoryServices{
  static ApiService api = ApiService();
  static Future<List<HistoryDataModel>?> getHistoryData(String memberId,String homeVisit) async {
    List<HistoryDataModel>? historyList = [];
    var data = await api.request(Services.getHistoryDataEndPoint, "POST",queryParamters: {
      "member_id":"1",
      "home_visit":homeVisit
    });
    if (data != null) {
      for (var history in data){
        historyList.add(HistoryDataModel.fromJson(history));
      }
      return historyList;
    }
    return null;
  }
}