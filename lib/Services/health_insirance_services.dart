import 'package:privilegecare/Models/health_insurance_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class HealthInsuranceServices {
  static ApiService api = ApiService();
  static Future<HealthInsuranceModel?> getHealthInsuranceData(String hospitalId) async {
    var data = await api.request(Services.getHelpDataEndPoint, "POST",);
    if (data != null) {
      return HealthInsuranceModel.fromJson(data[0]);
    }
    return null;
  }
  static Future<ResponseModel?> setHealthInsurance (String userId,String cardNumber,String cardName) async {
    var data = await api.request(Services.forgetPasswordEndPoint, "POST",queryParamters: {
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