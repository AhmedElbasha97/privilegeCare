import 'package:privilegecare/Models/history_data_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HistoryServices{
  static ApiService api = ApiService();
  static Future<List<HistoryDataModel>?> getHospitalBanners(String memberId,String homeVisit) async {
    List<HistoryDataModel>? bannerList = [];
    var data = await api.request(Services.getHistoryDataEndPoint, "POST",queryParamters: {
      "member_id":memberId,
      "home_visit":homeVisit
    });
    if (data != null) {
      for (var banner in data){
        bannerList.add(HistoryDataModel.fromJson(banner));
      }
      return bannerList;
    }
    return null;
  }
}