import 'package:get/get.dart';
import 'package:privilegecare/Utils/memory.dart';

class ProfileController extends GetxController{
  List<String> icons = [
    "updateProfileIcon",
    "medicalInsuranceIcon",
    "helpIcon",
    "changePasswordIcon",
    "favoriteIcon",
    "settingsIcon",
    "termsIcon",
    "termsIcon",
    "privilegeIcon",
    "evaluationIcon",
    "signOutIcon"
  ];
  List<String> title =[
    "تحديث الملف الشخصي",
    "تأمين طبي",
    "يساعد",
    "تغيير كلمة المرور",
    "مفضل",
    "إعدادات",
    "سياسة الخصوصية",
    "الأحكام والشروط",
    "نقاط رعاية الامتياز",
    "تقييم التطبيق",
    "خروج",
  ];
  bool userIsSigned = true;
  @override
  void onInit() {
    super.onInit();
    checkUserSignedOrNet();
  }
  checkUserSignedOrNet(){
    if(Get.find<StorageService>().getId == "0"){
      userIsSigned = false;
      update();
    }else{
      userIsSigned = true;
      update();
    }
  }
}