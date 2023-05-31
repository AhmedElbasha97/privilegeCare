import 'package:get/get.dart';
import 'package:privilegecare/Utils/translation_key.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      greetingWord:"Hello",
      requiredFiled:"This field is required",
      invalidEmail:"This e-mail is invalid",
      invalidPassword:"This password is invalid",
      tryAgain:"Please try again later",
      noInternet:"There's no internet connection",
      openInternet:"Please open your internet and try again",
      location:"The location",
      locationRequired:"The location is required so you can continue",
      error:"There's error happen please try again later",
      phoneNumberError:"This phone number is not valid",
      invalidReTypePassword:"passwords does not match",
      enterPasswordFirst:"You must enter the password first",
      refreshKey:"Refresh",
      cameraSource1:"take a picture",
      cameraSource2:"Choose a photo from the photo gallery",


    },
    "ar": {
      greetingWord:"اهلا وسهلا بك",
      requiredFiled:"هذه الخانة مطلوبه",
      invalidEmail:"هذا البريد الإلكتروني غير صالح",
      invalidPassword:"كلمة السر هذه غير صالحة",
      tryAgain:"الرجاء معاودة المحاولة في وقت لاحق",
      noInternet:"لا يوجد اتصال بالإنترنت",
      openInternet:"الرجاء فتح الإنترنت الخاص بك وحاول مرة أخرى",
      location:"الموقع",
      locationRequired:"الموقع مطلوب حتى تتمكن من المتابعة",
      error:"حدث خطأ ، يرجى المحاولة مرة أخرى لاحقًا",
      phoneNumberError:"رقم التلفون هذا غير صالح",
      invalidReTypePassword:"كلمه السر غير متطابقة",
      enterPasswordFirst:"يجب إدخال كلمه السر اولآ",
      refreshKey:"المحاوله مره اخرى",
      cameraSource1:"التقط صوره",
      cameraSource2:"اختيار صوره من معرض الصور",

}
  };
}