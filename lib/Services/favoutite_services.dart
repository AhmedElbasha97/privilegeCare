import 'package:privilegecare/Models/added_or_not_favorite_model.dart';
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
  static Future<int?> getAddedOrNotToFavoritesDoctor(String doctorId,String memberId) async {
    var data = await api.request(Services.checkAddedToFavoriteOrNotEndPoint, "POST",queryParamters: {
      "doctor_id":doctorId,
      "member_id":memberId
    });
    if (data != null) {
      return FavoriteAddedOrNot.fromJson(data).status;
    }
    return null;
  }

}