import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class AppInfoServices{
  static ApiService api = ApiService();
  Future<PrivacyPolicy?> getPrivacyPolicy() async {
    var data = await api.request(Services.getPrivacyPolicyEndPoint, "POST");
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }
  Future<PrivacyPolicy?> getTermsAndCondition() async {
    var data = await api.request(Services.getTermsAndConditionEndPoint, "POST");
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }
  Future<PrivacyPolicy?> getChatLink() async {
    var data = await api.request(Services.getChatLinkEndPoint, "POST");
    if (data != null) {
      return PrivacyPolicy.fromJson(data);
    }
    return null;
  }

}