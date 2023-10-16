import 'package:get/get.dart';
import 'package:privilegecare/Models/privacy_policy_model.dart';
import 'package:privilegecare/Services/app_info_services.dart';

class HelpController extends GetxController{
  late PrivacyPolicy? helpData;
  bool loading = true;


  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<HelpController>();
  }
  getData() async {
    helpData = await AppInfoServices.getHelpData();
    loading = false;
    update();
  }
}