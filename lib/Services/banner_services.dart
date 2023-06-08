import 'package:privilegecare/Models/banner_model.dart';
import 'package:privilegecare/Models/hospital_banner_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class BannerServices {
  static ApiService api = ApiService();
  static Future<List<BannerModel>?> getHomeBanners() async {
    List<BannerModel>? bannerList = [];
    var data = await api.request(Services.homeBannersEndPoint, "POST");
    if (data != null) {
      for (var banner in data){
        bannerList.add(BannerModel.fromJson(banner));
      }
      return bannerList;
    }
    return null;
  }
  static Future<List<BannerModel>?> getSecondHomeBanners() async {
    List<BannerModel>? bannerList = [];
    var data = await api.request(Services.secondHomeBannersEndPoint, "POST");
    if (data != null) {
      for (var banner in data){
        bannerList.add(BannerModel.fromJson(banner));
      }
      return bannerList;
    }
    return null;
  }
  static Future<List<HospitalBannerModel>?> getHospitalBanners() async {
    List<HospitalBannerModel>? hospitalBannerList = [];
    var data = await api.request(Services.hospitalBannersEndPoint, "POST");
    if (data != null) {
      for (var hospitalBanner in data){
        hospitalBannerList.add(HospitalBannerModel.fromJson(hospitalBanner));
      }
      return hospitalBannerList;
    }
    return null;
  }

}