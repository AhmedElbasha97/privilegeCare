import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/banner_model.dart';
import 'package:privilegecare/Models/doctor_home_model.dart';
import 'package:privilegecare/Services/banner_services.dart';
import 'package:privilegecare/Services/doctor_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController{
  bool isLoading = true;
  bool slideShowLoading = true;
  List<DoctorHomeModelData>? doctorData = [];
  List<BannerModel>? sliderData = [];
  void onInit() {
    // TODO: implement onInit

    getData();
    getSliderData();
    super.onInit();
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
  launchURL(context,link) async {
    if ( !await launchUrl(Uri.parse(link??""))) {

      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "حدث خطأ",
          text: "لا يمكن فتح هذا الرابط"
      );

    }
  }
}