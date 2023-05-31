// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiomatricsAuthService {
  static Future<bool> authenticateUser(String reason) async {
    //initialize Local Authentication plugin.
    final LocalAuthentication _localAuthentication = LocalAuthentication();
    //status of authentication.
    bool isAuthenticated = false;
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    //check if user has enabled biometrics.
    //check
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await _localAuthentication.authenticate(

            localizedReason: Platform.isAndroid
                ?'يجب فحص بصمت اصبع كى تستطيع $reason':"$reasonيجب فحص بصمت وجهك كى تستطيع ",);
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
  }