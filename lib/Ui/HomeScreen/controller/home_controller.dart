import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/banner_model.dart';
import 'package:privilegecare/Models/doctor_home_model.dart';
import 'package:privilegecare/Models/hospital_banner_model.dart';
import 'package:privilegecare/Services/banner_services.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController{
  bool isLoading = true;
  bool slideShowLoading = true;
  bool hospitalSlideShowLoading = true;
  List<DoctorHomeModelData>? doctorData = [];
  List<BannerModel>? sliderData = [];
  List<BannerModel>? secondSliderData = [];
  List<HospitalBannerModel>? hospitalBanner = [];
  @override
  void onInit() {
    // TODO: implement onInit

    getData();
    getSliderData();
    getSecondSliderData();
    getHospitalSliderData();
    super.onInit();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<HomeController>();
  }
  getData() async {
    doctorData = await DoctorServices.getHomeDoctors();
    isLoading = false;
    update();
  }

  getSliderData() async {
    sliderData = await BannerServices.getHomeBanners();
    slideShowLoading = false;
    update();
  }
  getSecondSliderData() async {
    secondSliderData = await BannerServices.getSecondHomeBanners();
    slideShowLoading = false;
    update();
  }

  getHospitalSliderData() async {
    hospitalBanner = await BannerServices.getHospitalBanners();
    hospitalSlideShowLoading = false;
    update();
  }

  launchURL(context,link) async {
    if ( !await launchUrl(Uri.parse(link??""),mode: LaunchMode.externalApplication)) {

      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: errorKey.tr,
          text: notAvailableLink.tr
      );

    }
  }
}