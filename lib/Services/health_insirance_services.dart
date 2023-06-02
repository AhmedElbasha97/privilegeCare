import 'package:privilegecare/Models/health_insurance_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HealthInsuranceServices {
  static ApiService api = ApiService();
  static Future<HealthInsuranceModel?> getHealthInsuranceData(String userId) async {
    var data = await api.request(Services.getHealthInsuranceData, "POST",queryParamters: {
      "member_id":userId,
    });
    if (data != null) {
      return HealthInsuranceModel.fromJson(data[0]);
    }
    return null;
  }
  static Future<ResponseModel?> setHealthInsurance (String userId,String cardNumber,String cardName) async {
    var data = await api.request(Services.setHealthInsuranceData, "POST",queryParamters: {
      "member_id":userId,
      "name":cardName,
      "card":cardNumber
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}