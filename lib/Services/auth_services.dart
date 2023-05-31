
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';


import 'package:privilegecare/Models/auth_model.dart';
import 'package:privilegecare/Models/profile_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';

import 'package:privilegecare/Utils/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static Future<ResponseModel?> changePassword(String memberId,String password) async {
    var data = await api.request(Services.changePasswordEndPoint, "POST",queryParamters: {
      "member_id":memberId,
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
  static Future<ResponseModel?> deleteAccount (String memberId) async {
    var data = await api.request(Services.deleteAccountEndPoint, "POST",queryParamters: {
      "member_id":memberId,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<ProfileModel?> getUserData (String memberId) async {
    var data = await api.request(Services.getUserDataEndPoint, "POST",queryParamters: {
      "member_id":memberId,
    });
    if (data != null) {
      return ProfileModel.fromJson(data[0]);
    }
    return null;
  }
   static Future<AuthModel?> signUp (String name,String email,String phone,String password,String password2) async {
    var data = await api.request(Services.signUpEndPoint, "POST",queryParamters: {
      "name":name,
      "email":email,
      "phone":phone,
      "password":password,
      "password2":password2
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> editAccountData (String name,String email,String phone,String userId,) async {
    var data = await api.request(Services.editAccountDataEndPoint, "POST",queryParamters: {
      "member_id":userId,
      "name":name,
      "email":email,
      "phone":phone,


    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> editAccountDataWithImage (String name,String email,String phone,String userId,XFile?  img) async {
    var data = await api.request(Services.editAccountDataEndPoint, "POST",queryParamters: {
      "member_id":userId,
      "name":name,
      "email":email,
      "phone":phone,
      "image":img?.path==null?null:await MultipartFile.fromFile(img?.path??"")
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }

}