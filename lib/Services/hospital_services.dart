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
}