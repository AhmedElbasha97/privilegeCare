// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
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
                ?'يجب فحص بصمت اصبع كى تستطيع تغير كلمه السر':"يجب فحص بصمت وجهك كى تستطيع تغير كلمه السر",);
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
  }