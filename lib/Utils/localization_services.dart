import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:privilegecare/Utils/memory.dart';

class SupportedLocales {
  static List<Locale> all = [Locale("en"), Locale("ar")];

  static Locale english = Locale("en");
  static Locale arabic = Locale("ar");
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
    //in storage
    Get.find<StorageService>().activeLocale = newLocale;

    //in Getx
    Get.updateLocale(newLocale);
  }
}