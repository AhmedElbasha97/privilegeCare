import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/hospital_detailed_model.dart';
import 'package:privilegecare/Models/hospital_doctor_model.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HospitalServices{
  static ApiService api = ApiService();
  static Future<List<HospitalListModel>?> getHospitalList(String specialtyId) async {
    List<HospitalListModel>? hospitalsList = [];
    var data = await api.request(Services.hospitalListEndPoint, "POST",queryParamters: {
      "specialist_id":specialtyId,
    });
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
  static Future<HospitalDetailedModel?> getHospitalProfile(String hospitalId) async {
    var data = await api.request(Services.getHospitalProfileEndPoint, "POST",queryParamters: {
      "hospital_id":hospitalId
    });
    if (data != null) {


      return HospitalDetailedModel.fromJson(data[0]);
    }
    return null;
  }
  static Future<List<HospitalDoctorData>?> getDoctorsInThisHospital(String hospitalId) async {
    List<HospitalDoctorData>? doctorsList = [];
    var data = await api.request(Services.doctorsInTheHospitalEndPoint, "POST",queryParamters: {
      "hospital_id":hospitalId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(HospitalDoctorData.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<PrivacyPolicy?> getXRayData(String hospitalId) async {
    var data = await api.request(Services.getXRayDataEndPoint, "POST",queryParamters: {
      "hospital_id":hospitalId,
    });
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }
  static Future<PrivacyPolicy?> getLapData(String hospitalId) async {
    var data = await api.request(Services.getLapDataEndPoint, "POST",queryParamters: {
      "hospital_id":hospitalId,
    });
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }
}