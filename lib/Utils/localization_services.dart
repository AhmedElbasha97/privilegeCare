import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Services/app_info_services.dart';

import 'package:privilegecare/Utils/memory.dart';

class SupportedLocales {
  static List<Locale> all = [const Locale("en"), const Locale("ar")];

  static Locale english = const Locale("en");
  static Locale arabic = const Locale("ar");
}

class LocalizationService extends GetxService {
  LocalizationService(this._activeLocale);

  final Locale _activeLocale;

  Locale get activeLocale => _activeLocale;

  static LocalizationService init() {
    //Get active local from storage
    Locale activeLocale = Get.find<StorageService>().activeLocale;
    return LocalizationService(activeLocale);
  }

  void toggleLocale() {
    final Locale newLocale =
    Get.find<StorageService>().activeLocale == SupportedLocales.arabic
        ? SupportedLocales.english
        : SupportedLocales.arabic;
    Get.find<StorageService>().activeLocale == SupportedLocales.arabic
        ?AppInfoServices().sendActiveLang( Get.find<StorageService>().getId, "en"):AppInfoServices().sendActiveLang( Get.find<StorageService>().getId, "ar");
    //in storage
    Get.find<StorageService>().activeLocale = newLocale;

    //in Getx
    Get.updateLocale(newLocale);
  }
}