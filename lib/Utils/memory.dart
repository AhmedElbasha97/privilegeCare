import 'dart:ui';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String accountType = "type";
  static const String accountName = "name";
  static const String accountIsManager = "manager";
  static const String compId = "comp_Id";
  static const String accountId = "id";
  static const String companyCode = "companyCode";
  static const String firstTimeOpenApp = "First_Time_Open_App";
  static const String recordAttendance = "Record_Attendance";
  static const String recordDismissal = "recordDismissal";
  static const String locationId = "Location_Id";
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    // await GetStorage.init();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  //to save type of the account
  Future<void> saveAccountType(String type) async =>
      _prefs.setString(StorageKeys.accountType, type);

  //to save name of account if employer or company
  Future<void> saveName(String employerName) async =>
    _prefs.setString(StorageKeys.accountName, employerName);

  //to save any id if employer or company
  Future<void> saveId(int id) async =>
    _prefs.setInt(StorageKeys.accountId, id);
  //to save if employee is manager or not
  Future<void>  safeIsManager (bool  isManager) async =>
  _prefs.setBool(StorageKeys.accountIsManager,isManager);

  //to save company id for chat
  Future<void> saveCompId (String  compId) async =>
     _prefs.setString(StorageKeys.compId,compId);

  //to save generated company code from our app
  Future<void> saveCompanyCode(int  companyCode) async =>
    _prefs.setInt(StorageKeys.companyCode, companyCode);
  //to save first time the app opened for the boarding screen
  Future<void> saveFirstTimeAppOpen(bool  firstTime) async =>
      _prefs.setBool(StorageKeys.firstTimeOpenApp, firstTime);
  //to save data when user record attendance when app offline
  Future<void> saveAttendance(List<String>  attendanceData) async =>
      _prefs.setStringList(StorageKeys.recordAttendance, attendanceData);
  //to save data when user record dismissal when app offline
  Future<void> saveDismissal(List<String>  dismissalData) async =>
      _prefs.setStringList(StorageKeys.recordAttendance, dismissalData);
  //to save location id
  Future<void> saveLocationId(String  locationId) async =>
      _prefs.setString(StorageKeys.locationId, locationId);

  //to get type of account company or employer
  String get  getAccountType {
    return _prefs.getString(StorageKeys.accountType)??"";
  }
  //to get Location Id
  String get  getLocationId {
    return _prefs.getString(StorageKeys.locationId)??"";
  }
  //to get id of account if company or employer
  int get getId {
    return _prefs.getInt(StorageKeys.accountId)?? 0;
  }
  //to get name of account if employer or company
  String get getName {
    return _prefs.getString(StorageKeys.accountName)??"";
  }
  //to get if employee is manager or not
  bool get isManager {
    return _prefs.getBool(StorageKeys.accountIsManager)??false;
  }
  //to get company id for chat
  String get compId {
    return _prefs.getString(StorageKeys.compId)??"";
  }
  //to get company code of account if employer or company
  int get getCompanyCode  {
    return _prefs.getInt(StorageKeys.companyCode)??0;
  }
//to get first time app open
  bool get getFirstTimeTheAppOpen  {
    return _prefs.getBool(StorageKeys.firstTimeOpenApp)??false;
  }
  //to get data when user record attendance when app offline
  List<String> get getAttendance  {
    return _prefs.getStringList(StorageKeys.recordAttendance)??[];
  }
  // to check if user record dismissal or not
  bool get getRecordAttendance  {
    return _prefs.containsKey(StorageKeys.recordAttendance);
  }
  //to get data when user record dismissal when app offline
  List<String> get getDismissal  {
    return _prefs.getStringList(StorageKeys.recordDismissal)??[];
  }
  // to check if user record dismissal or not
  bool get getRecordDismissal  {
    return _prefs.containsKey(StorageKeys.recordDismissal);
  }


  loggingOut(){
    _prefs.remove(StorageKeys.accountId);
  }
  //Active Locale
  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.arabic.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }
}