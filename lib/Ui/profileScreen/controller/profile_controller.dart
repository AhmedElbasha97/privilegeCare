
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:privilegecare/Models/profile_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/app_info_services.dart';
import 'package:privilegecare/Services/auth_services.dart';
import 'package:privilegecare/Services/biomatrics_auth_services.dart';
import 'package:privilegecare/Ui/changePassword/change_password_screen.dart';
import 'package:privilegecare/Ui/editProfile/edit_profile_screen.dart';
import 'package:privilegecare/Ui/favorite/favorite_screen.dart';
import 'package:privilegecare/Ui/insurancescreens/insurance_screen.dart';
import 'package:privilegecare/Ui/privacypolicy/privacyPolicyScreen.dart';
import 'package:privilegecare/Ui/profileScreen/widget/choose_camera_source.dart';
import 'package:privilegecare/Ui/term&condition/terms_screen.dart';
import 'package:privilegecare/Ui/userHistory/user_history_screen.dart';
import 'package:privilegecare/Ui/welcomeScreen/welcome_screen.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController{
  String? chatLink = "";
  bool isLoading = true;
  late ProfileModel? data;
  int indexDeleteAccount = 2;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  List<String> icons = [
    "updateProfileIcon",
    "medicalInsuranceIcon",
    "helpIcon",
    "historyIcon",
    "changePasswordIcon",
    "favoriteIcon",
    "settingsIcon",
    "termsIcon",
    "termsIcon",

    "evaluationIcon",
    "signOutIcon"
  ];
  List<String> title =[
    "تحديث الملف الشخصي",
    "تأمين طبي",
    "الدعم الفنى(شات)",
    "تاريخ معملاتى",
    "تغيير كلمة المرور",

    "مفضل",
    "تغير اللغة",
    "سياسة الخصوصية",
    "الأحكام والشروط",

    "تقييم التطبيق",
    "خروج",
  ];
  bool userIsSigned = true;
  @override
  void onInit() {
    super.onInit();
    checkUserSignedOrNet();
  }
  decideWhichScreenToOpen(int index,context) async {
    switch(index) {
      case 0:{
        Get.to(()=>const EditProfileScreen());
      }
      break;
      case 1:{
        Get.to(()=>const InsuranceScreen());
      }
      break;
      case 2:{
        launchURL(context, chatLink);
      }
      break;
      case 3:{
       Get.to(()=>const HistoryScreen());
      }
      break;
      case 4:{
        goToChangePass();
      }
      break;
      case 5:{
        Get.to(()=>const FavoriteScreen());
      }
      break;
      case 6:{

      }
      break;
      case 7:{
        Get.to(()=>const PrivacyPolicyScreen());
      }
      break;
      case 8:{
        Get.to(()=>const TermsScreen());
      }
      break;
      case 9:{

      }
      break;
      case 10:{
        rateMyApp();
      }
      break;
      case 11:{
        signingOut(context);
      }
      break;

    }

  }
   rateMyApp() async {

     final InAppReview inAppReview = InAppReview.instance;

     if (await inAppReview.isAvailable()) {
     inAppReview.requestReview();
     }
   }
  goToChangePass() async {
    if(await BiomatricsAuthService.authenticateUser("تغير كلمه السر")) {
      Get.to(() => const ChangePasswordScreen());
    }
  }
  checkUserSignedOrNet(){
    if(Get.find<StorageService>().getId == "0"){
      userIsSigned = false;
      update();
    }else{
      userIsSigned = true;
      getData();
      update();
    }
  }
  getData() async {
    isLoading = true;
    update();
   chatLink = await AppInfoServices().getChatLink();
   data = await AuthServices.getUserData( Get.find<StorageService>().getId);
   isLoading = false;
   update();
  }
  Future<void> getImageFromUserThroughCamera(context) async {
    image = await _picker.pickImage(source: ImageSource.camera);
    uploadDataToServer(context);
    update();
  }

  //get image from user through gallery
  Future<void> getImageFromUserThroughGallery(context) async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    uploadDataToServer(context);
    update();
  }
  uploadDataToServer(context) async {
    ResponseModel? reponse = await AuthServices.editAccountDataWithImage(data?.name??"", data?.email??"", data?.phone??"", "${data?.id??0}", image);
    if(reponse?.msg == "succeeded"){

      getData();
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "حدث خطأ",
        text: Get.find<StorageService>().activeLocale == SupportedLocales.english?reponse?.msg??"":reponse?.msgAr??"",
      );
    }
  }
  choosePhotoSource(context) async {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context, builder: (BuildContext context) {
      return ChooseCameraSource(openCamera: () {
        getImageFromUserThroughCamera(context);
      }, openGallery: () {
        getImageFromUserThroughGallery(context);
      },);
    });
  }

  signingOut(context){
    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      title: "",
      text: 'تسجيل الخروج من الحساب',
      textTextStyle: const TextStyle(
          fontFamily: fontFamilyName,
          color: kBlueColor,
          fontWeight: FontWeight.w800,
          fontSize: 15),
      onConfirmBtnTap: (){
        Get.find<StorageService>().loggingOut();
        Get.to(()=>const WelcomeScreen());

      },
      onCancelBtnTap:(){
        indexDeleteAccount = 1;
      },
      confirmBtnText: 'الخروج من الحساب',
      cancelBtnText: 'مسح الحساب',
      confirmBtnColor: Colors.white,
      cancelBtnTextStyle:   const TextStyle(
          fontFamily: fontFamilyName,
          color: Colors.red,
          fontWeight: FontWeight.w800,
          fontSize: 15),
      confirmBtnTextStyle: const TextStyle(
          fontFamily: fontFamilyName,
          color: kGreenColor,
          fontWeight: FontWeight.w800,
          fontSize: 15),
    ).then((value){
      if(indexDeleteAccount == 1){
        deleteAccount(context);
      }
    });
  }
deleteAccount(context){
  CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: "تحذير",
      titleTextStyle: const TextStyle(
          fontFamily: fontFamilyName,
          color: kBlueColor,
          fontWeight: FontWeight.w700,
          fontSize: 15),
      text: "مسح الحساب سوف يترتب عليه خساره جميع البينات المسجله وايضا خساره النقاط المكتسبة",
      textTextStyle: const TextStyle(
          fontFamily: fontFamilyName,
          color: kBlueColor,
          fontWeight: FontWeight.w700,
          fontSize: 15),
      confirmBtnText: "استكمال المسح",
    confirmBtnColor: Colors.white,
    confirmBtnTextStyle:  const TextStyle(
        fontFamily: fontFamilyName,
        color: Colors.red,
        fontWeight: FontWeight.w600,
        fontSize: 15),
    onConfirmBtnTap: () async {
      if(await BiomatricsAuthService.authenticateUser("مسح الحساب")) {
        ResponseModel? reponse = await AuthServices.deleteAccount(Get.find<StorageService>().getId);
        if(reponse?.msg == "succeeded"){

          Get.to(()=>const WelcomeScreen());
        }else{
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدث خطأ",
            text: Get.find<StorageService>().activeLocale == SupportedLocales.english?reponse?.msg??"":reponse?.msgAr??"",
          );
        }
      }

    },
  );
}

  launchURL(context,link) async {
    if ( !await launchUrl(Uri.parse(link??""),mode: LaunchMode.externalApplication)) {

      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "حدث خطأ",
          text: "لا يمكن فتح هذا الرابط"
      );

    }
  }
}