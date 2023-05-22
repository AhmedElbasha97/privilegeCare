import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class SpecialistServices{
  static ApiService api = ApiService();
  static Future<List<SpecialistModel>?> getAllSpecialist() async {
    List<SpecialistModel>? specialistList = [];
    var data = await api.request(Services.specialistEndPoint, "POST",);
    if (data != null) {
      for (var specialist in data){
        specialistList.add(SpecialistModel.fromJson(specialist));
      }
      return specialistList;
    }
    return null;
  }
  static Future<List<SpecialistModel>?> getMostChosenSpecialist() async {
    List<SpecialistModel>? specialistList = [];
    var data = await api.request(Services.specialistMostChosenEndPoint, "POST",);
    if (data != null) {
      for (var specialist in data){
        specialistList.add(SpecialistModel.fromJson(specialist));
      }
      return specialistList;
    }
    return null;
  }

}