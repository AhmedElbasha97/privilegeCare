import 'package:get/get.dart';
import 'package:privilegecare/Models/auth_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static Future<ResponseModel?> changePassword(String password) async {
    var data = await api.request(Services.changePasswordEndPoint, "POST",queryParamters: {
      "member_id":Get
          .find<StorageService>()
          .getId,
      "password":password,

    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> logIn (String email,String password) async {
    var data = await api.request(Services.logInEndPoint, "POST",queryParamters: {
      "email":email,
      "password":password,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
   static Future<AuthModel?> signUp (String name,String email,String password,String password2) async {
    var data = await api.request(Services.signUpEndPoint, "POST",queryParamters: {
      "name":name,
      "email":email,
      "password":password,
      "password2":password2
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }

}