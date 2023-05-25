import 'package:get/get.dart';

class ProfileController extends GetxController{
  List<String> icons = [
    "updateProfileIcon",
    "medicalInsuranceIcon",
    "creditCardIcon",
    "helpIcon",
    "changePasswordIcon",
    "favoriteIcon",
    "settingsIcon",
    "termsIcon",
    "privilegeIcon",
    "evaluationIcon",
    "signOutIcon"
  ];
  List<String> title =[
    "تحديث الملف الشخصي",
    "تأمين طبي",
    "بطاقات الائتمان",
    "يساعد",
    "تغيير كلمة المرور",
    "مفضل",
    "إعدادات",
    "الأحكام والشروط",
    "نقاط رعاية الامتياز",
    "تقييم التطبيق",
    "خروج",
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  checkUserSignedOrNet(){
    
  }
}