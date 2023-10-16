import 'package:privilegecare/Models/chat_link_model.dart';
import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Models/whats_app_model.dart';
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

  Future<WhatsAppModel?> getWhatsAppNumber() async {
    var data = await api.request(Services.getWhatsAppNumberEndPoint, "POST");
    if (data != null) {
      return WhatsAppModel.fromJson(data[0]);
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
  Future<String?> getChatLink() async {
    var data = await api.request(Services.getChatLinkEndPoint, "POST");
    if (data != null) {
      return ChatLink.fromJson(data[0]).link;
    }
    return null;
  }
  static Future<PrivacyPolicy?> getHelpData() async {
    var data = await api.request(Services.getHelpDataEndPoint, "POST",);
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }
}