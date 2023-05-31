import 'package:privilegecare/Models/added_or_not_favorite_model.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class FavouriteServices{
  static ApiService api = ApiService();
  static Future<ResponseModel?> addOrRemoveDoctorFromFavorite(String doctorId,String memberId, String status) async {
    var data = await api.request(Services.addOrRemoveDoctorsFromFavourite, "POST",queryParamters: {
      "doctor_id":doctorId,
      "member_id":memberId,
      "status":status,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> addOrRemoveHospitalFromFavorite(String hospitalId,String memberId, String status) async {
    var data = await api.request(Services.addOrRemoveHospitalFromFavourite, "POST",queryParamters: {
      "hospital_id":hospitalId,
      "member_id":memberId,
      "status":status,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<int?> getAddedOrNotToFavoritesDoctor(String doctorId,String memberId) async {
    var data = await api.request(Services.checkAddedToFavoriteOrNotDoctorEndPoint, "POST",queryParamters: {
      "doctor_id":doctorId,
      "member_id":memberId
    });
    if (data != null) {
      return FavoriteAddedOrNot.fromJson(data).status;
    }
    return null;
  }
  static Future<int?> getAddedOrNotToFavoritesHospital(String hospitalId,String memberId) async {
    var data = await api.request(Services.checkAddedToFavoriteOrNotHospitalEndPoint, "POST",queryParamters: {
      "hospital_id":hospitalId,
      "member_id":memberId
    });
    if (data != null) {
      return FavoriteAddedOrNot.fromJson(data).status;
    }
    return null;
  }
  static Future<List<DoctorListModel>?> getDoctorsInThisFavoriteList(String memberId) async {
    List<DoctorListModel>? doctorsList = [];
    var data = await api.request(Services.doctorsFavoriteListEndPoint, "POST",queryParamters: {
      "member_id":memberId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(DoctorListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<List<HospitalListModel>?> getHospitalInThisFavoriteList(String memberId) async {
    List<HospitalListModel>? doctorsList = [];
    var data = await api.request(Services.hospitalFavoriteListEndPoint, "POST",queryParamters: {
      "member_id":memberId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(HospitalListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
}