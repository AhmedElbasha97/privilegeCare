import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HospitalServices{
  static ApiService api = ApiService();
  static Future<List<HospitalListModel>?> getHospitalList() async {
    List<HospitalListModel>? hospitalsList = [];
    var data = await api.request(Services.hospitalListEndPoint, "POST",);
    if (data != null) {
      for (var hospital in data){
        hospitalsList.add(HospitalListModel.fromJson(hospital));
      }
      return hospitalsList;
    }
    return null;
  }
  static Future<List<HospitalListModel>?> advancedSearchForDoctorsWithArea(String searchType,String specialtyId,String areaId,String levelId,String startPrice,String endPrice,String homeVisit) async {
    List<HospitalListModel>? hospitalsList = [];
    var data = await api.request(Services.advancedSearchEndPoint, "POST",queryParamters: {
      "type":searchType,
      "spec":specialtyId,
      "area":areaId,
      "price_from":startPrice,
      "price_to":endPrice,

    });
    if (data != null) {
      for (var hospital in data){
        hospitalsList.add(HospitalListModel.fromJson(hospital));
      }
      return hospitalsList;
    }
    return null;
  }
}