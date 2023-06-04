import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart' as localized;
import 'package:permission_handler/permission_handler.dart';
import 'package:privilegecare/Models/history_data_model.dart';
import 'package:privilegecare/Services/histotry_services.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class UserHistoryController extends GetxController{
  final ScrollController sController = ScrollController();
  bool isLoading = true;
  bool hasNoData = false;
  int homeVisitOrNot = 0;

  List<HistoryDataModel>? historyData = [];

  final pdf = pw.Document();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    historyData = await HistoryServices.getHistoryData(Get
        .find<StorageService>()
        .getId, "$homeVisitOrNot");
    await initializeDateFormatting("ar_SA", null);
    if(historyData?.length == 0||historyData==[]){
      hasNoData = false;
    }
    isLoading = false;
    update();
  }
  detectStatus(String index){
    if(index == "Pindding"){
      return 0;
    }else{
      return 1;
    }
  }
  String returnDateAndTime(String date)  {
    String dateOrTime = "" ;
    final format = DateFormat('HH:mm a');
    DateFormat formatDate =  DateFormat.yMMMd('ar_SA');
    final dateTime = DateTime.parse(date);
    if(dateTime.day == DateTime.now().day){
      dateOrTime = format.format(dateTime);
    }else{
      dateOrTime = formatDate.format(dateTime);
    }
    return dateOrTime;
  }

  changeTap(int index){
    homeVisitOrNot = index;
    isLoading = true;
    getData();
    update();
  }
}